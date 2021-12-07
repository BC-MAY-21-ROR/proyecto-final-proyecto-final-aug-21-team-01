Rails.application.routes.draw do
  # routes for users authentication
  devise_for :users
  # route for root site
  root 'home#index'
  # routes for groups requests
  resources :groups
  post '/upgrade', to: 'stripe#upgrade'
  post '/downgrade', to: 'stripe#downgrade'
  post '/billing/create', to: 'preferences#billing', as: 'billing_portal_create'
  get '/account/suscription', to: 'preferences#plan'
  resources :webhooks, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
