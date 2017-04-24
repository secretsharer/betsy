Rails.application.routes.draw do
  get 'carts/show'

  root 'products#index'

  resources :orderitems, only: [:create, :update, :destroy]

  resources :merchants do
    resources :products, only: [:index, :new, :create]
  end

  resources :orders

  resources :categories, only: [:index, :new, :create]

  resources :products
  resource :order, only: [:show]

end
