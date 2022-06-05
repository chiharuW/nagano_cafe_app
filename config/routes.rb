Rails.application.routes.draw do
  #顧客用
  #URL　/customers/sign_in...
  devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: "public/sessions"
  }

  #管理者用
  #URL /admin/sign_in...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


   get '/' => 'public/homes#top'
   get '/about'=> "public/homes#about", as: "about"
   # get '/mypage' => 'customers#mypage'
   scope module: :public do
    resource :customers, only:[:show, :edit, :update] do
     collection do
      get :my_page
     end
    end
   end
   # resources :customers, only:[:show, :edit, :update, :unsubscribe, :withdraw]
   resources :sessions, only:[:new, :create, :destroy]
   
   scope module: :public do
    resources :address, only:[:new, :create, :index, :update, :edit, :destroy]
   end
   
   scope module: :public do
    resources :orders, only:[:new, :create, :index, :show] do
     collection do
      post :comfirm
      get :complete
     end
    end
   end


  namespace :admin do
   root to: 'homes#top'
   resources :genres, only: [:edit, :index, :create, :update]
   resources :items, only: [:new, :show, :edit, :index, :create, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :orders, only: [:index, :show, :edit, :update]
   resources :sessions, only:[:new, :create, :destroy]
  end

end
