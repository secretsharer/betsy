Rails.application.routes.draw do
  get 'order_items/index'

  get 'orderitem/index'

  resources :merchants do
    resources :products, only: [:index]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
