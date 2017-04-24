Rails.application.routes.draw do
  resources :merchants do
    resources :products, only: [:index, :new, :create]
  end

  resources :categories, only: [:index, :new, :create]

  resources :products
  resource :order, only: [:show]

end
