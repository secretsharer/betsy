Rails.application.routes.draw do
  get 'carts/show'

  root 'products#index'


  resources :merchants do
    resources :products, only: [:index, :new, :create]
  end

  resources :orders

  resources :categories, only: [:index, :new, :create]

  resources :products

  resources :order_items, only: [:create, :update, :destroy]
end
