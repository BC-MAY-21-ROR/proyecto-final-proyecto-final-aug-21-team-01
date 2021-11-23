Rails.application.routes.draw do
  #routes for users authentication
  devise_for :users
  #route for root site
  root 'home#index'
  #routes for groups requests
  resources :groups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
