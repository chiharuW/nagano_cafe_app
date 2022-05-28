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

  namespace :admin do
   get 'items'  => 'admin/items#index'
   resources :genres, only: [:edit, :index, :create, :update]
  end

end
