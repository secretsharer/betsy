Rails.application.routes.draw do
  get 'carts/show'

  root 'products#index'

  get 'order_items/index'

  get 'orderitem/index'

  resources :merchants do
    resources :products, only: [:index, :new, :create]
  end

  resources :orders

  resources :categories, only: [:index, :new, :create]

  resources :products

  resources :orderitems, only: [:create, :update, :destroy]
end
