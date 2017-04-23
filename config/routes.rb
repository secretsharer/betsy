Rails.application.routes.draw do
  resources :merchants do
    resources :products, only: [:index]
  end

  resources :categories, only: [:index, :new, :create]

end
