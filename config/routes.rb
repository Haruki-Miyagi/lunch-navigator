Rails.application.routes.draw do
  resources :stars, only: [:create, :destroy]
  root controller: :shops, action: :index
  resources :shops, only:[:index]

  get 'dashboard' => 'home#dashboard'
  get 'auth/auth0', as: 'authentication'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'logout' => 'auth0#logout'

  get ':name' => 'shops#index'
end
