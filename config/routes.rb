Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'products#index'

  resources :categories, only: [:index] 

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  get '/cart/checkout', to: 'orders#new', as: :checkout
  post '/cart/checkout', to: 'orders#create'
  
  get '/categories/:category_id/products/:id', to: 'products#show', as: :product_cart
  post '/categories/:category_id/products/:id', to: 'products#create'
  get '/products/new/', to: 'products#new'
  get '/rooot/', to: 'layouts#index'
end
