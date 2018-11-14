Rails.application.routes.draw do
  get 'sessions_or_registrations/new'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  devise_for :users
  devise_for :orders, :controllers => {:sessions => 'sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'categories#index'

  resources :categories, only: [:index, :new, :create, :show, :update, :edit, :destroy] do
    resources :products, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  get '/cart/checkout', to: 'orders#new', as: :checkout
  post '/cart/checkout', to: 'orders#create'

  get '/admin/', to: 'categories#admin', as: :admin
  resources :charges, only: [:new, :create]

  
  

  
  

 

end
