Rails.application.routes.draw do
  get 'order_items/index'

  get 'orderitem/index'

  resources :merchants do
    resources :products, only: [:index, :new, :create]
  end

  resources :categories, only: [:index, :new, :create]

  resources :products
  resource :order, only: [:show]

end
