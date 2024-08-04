# frozen_string_literal: true

Rails.application.routes.draw do
  get 'site_contents/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # Custom route for sign out
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  resources :addresses
  resources :provinces
  root 'products#index'
  resources :products
  resource :cart, only: [:show] do
    get 'add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
    get 'remove_from_cart/:product_id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
    patch 'update_quantity/:product_id', to: 'carts#update_quantity', as: 'update_quantity'
  end
  resource :checkout, only: %i[new create] do
    get 'success'
  end
  resources :orders, only: %i[new create show index]
  get 'site_contents', to: 'site_contents#show', as: 'site_contents'
end
