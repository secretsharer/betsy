Rails.application.routes.draw do
  resources :merchants do
    resources :products, only: [:index, :new, :create]
  end

  resources :products
  resource :order, only: [:show]
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
