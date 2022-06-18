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


   root to: 'public/homes#top'
   get '/about'=> "public/homes#about", as: "about"
   # get '/mypage' => 'customers#mypage'
   scope module: :public do
    resource :customers do
     collection do
      get :my_page
      get :unsubscribe
      get :edit_page
     end
     patch "/withdraw" => "customers#withdraw"
     patch "/update" => "customers#update"
    end
   end
   # resources :customers, only:[:show, :edit, :update, :unsubscribe, :withdraw]
   resources :sessions, only:[:new, :create, :destroy]

   scope module: :public do
    resources :addresses, only:[:create, :index, :update, :edit, :destroy]
   end
   
   scope module: :public do
    resources :items, only:[:index, :show]
   end
   
   scope module: :public do
    resources :cart_items, only:[:index, :create, :update, :destroy] do
     collection do
      delete :destroy_all
     end
    end
   end

   scope module: :public do
    resources :orders, only:[:new, :create, :index, :show] do
     collection do
      post :comfirm
      get :complete
     end
    end
   end
   
   scope module: :public do
    resources :order_detail, only:[:index, :show]
   end




  namespace :admin do
   root to: 'homes#top'
   resources :genres, only: [:edit, :index, :create, :update]
   resources :items, only: [:new, :show, :edit, :index, :create, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :sessions, only:[:new, :create, :destroy]
   
   resources :orders, only: [:index, :show, :edit, :update]
   resources :order_details, only: [:update]

  end

end
