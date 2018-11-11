Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'categories#index'

  resources :categories, only: [:index, :new, :create, :show, :update, :edit, :destroy] do
    resources :products, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  get '/cart/checkout', to: 'orders#new', as: :checkout
  post '/cart/checkout', to: 'orders#create'

  get '/admin/', to: 'product_categories#index'
  get  '/admin/categories/:id', to: 'product_categories#show'

  
  

 

end
