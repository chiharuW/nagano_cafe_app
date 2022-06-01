Rails.application.routes.draw do
  #顧客用
  #URL　/customers/sign_in...
  devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: "public/sessions"
  }

  #管理者用
  #URL /admin/sign_in...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


   get 'items' => 'public/items#index'
   resources :customers, only:[:show, :edit, :update, :unsubscribe, :withdraw]

  namespace :admin do
   get 'top' => 'homes#top'
   resources :genres, only: [:edit, :index, :create, :update]
   resources :items, only: [:new, :show, :edit, :index, :create, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :orders, only: [:index, :show, :edit, :update]   
  end

end
