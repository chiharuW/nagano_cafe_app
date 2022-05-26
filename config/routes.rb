Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'items' => 'public/items#index'

  namespace :admin do
   get 'items' => 'admin/items#index'
  end

end
