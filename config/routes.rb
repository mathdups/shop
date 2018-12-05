Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', confirmations: 'confirmations' }


  
  devise_for :orders, :controllers => {:sessions => 'sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'categories#index'

  resources :categories, only: [:index, :show] do
    resources :products, only: [:show]
  end

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  get '/cart/checkout', to: 'orders#new', as: :checkout
  post '/cart/checkout', to: 'orders#create'
  patch '/cart/checkout/', to: 'orders#update'
  

   get '/admin/', to: 'categories#admin', as: :admin
  resources :charges, only: [:new, :create]

  resources :purchases, only: [:show]

  get '/blabla/', to: 'categories#blabla'

  patch '/users/', to: 'users#update'

  namespace :admin do
    resources :users, only: [:index]
    resources :products, only: [:new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :new, :edit, :create, :update ]
  end
end
