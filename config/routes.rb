Rails.application.routes.draw do
  scope "(:locale)", locale: /fr|en/ do

    root to: 'categories#index'
    devise_for :users, :controllers => { registrations: 'registrations', confirmations: 'confirmations' }
    devise_for :orders, :controllers => {:sessions => 'sessions'}

    resources :categories, only: [:index, :show] do
      resources :products, only: [:show]
    end

    get '/cart', to: 'order_items#index'
    resources :order_items, path: '/cart/items'
    get '/cart/checkout', to: 'orders#new', as: :checkout
    post '/cart/checkout', to: 'orders#create'
    patch '/cart/checkout/', to: 'orders#update'
    
    resources :charges, only: [:new, :create]
    resources :purchases, only: [:show]
    
  end

  namespace :admin do
    get '/user/:id/purchases/', to: 'users#purchases', as: :client
    resources :users, only: [:index, :update, :destroy, :edit]
    resources :products, only: [:new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :new, :edit, :create, :update ]
    resources :purchases, only: [:index, :update] 
    get '/', to: 'users#admin', as: :dashboard
   end
end
