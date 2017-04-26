Rails.application.routes.draw do
  get "/auth/:provider/callback", to: "sessions#create"

  get 'carts/show'
  delete 'carts/show', to: 'order_items#destroy', as: :destroy_item

  root 'products#index'
  post '/logout', to: 'sessions#logout', as: 'logout'

  resources :merchants do
    resources :products, only: [:index, :new, :create]
  end


  resources :orders

  resources :categories, only: [:index, :new, :create] do
    resources :products, only: [:index]
  end

  resources :reviews, only: [:create]

  resources :products

  # resources :carts, only: [:show] do
  #   resources :order_items, only: [:destroy]
  # end

  resources :order_items, only: [:create, :update, :destroy]


  get 'merchants/:id/account/products', to: "merchants#products", as: "account_products"
  get 'merchants/:id/account/orders', to: "merchants#orders", as: "account_orders"


  get "/:session_id/payments/edit", to: "payments#edit", as: "edit_payment"
  patch "/:session_id/payments/", to: "payments#update", as: "update_payment"

  get "/:carts/show/payment/", to: "payments#payment", as: "new_payment"
  patch "/:carts/show/payment/", to: "payments#update", as: "cart_update_payment"

end
