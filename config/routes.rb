Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'products#index'
  resources :products
  resource :cart, only: [:show] do
    get 'add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
    get 'remove_from_cart/:product_id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
    patch 'update_quantity/:product_id', to: 'carts#update_quantity', as: 'update_quantity'
  end
end
