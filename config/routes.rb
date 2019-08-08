Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lunchmaps

  root 'lunchmaps#index'

  get 'dashboard' => 'home#dashboard'
  get 'auth/auth0', as: 'authentication'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'logout' => 'auth0#logout'
end
