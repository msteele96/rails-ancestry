Rails.application.routes.draw do
  resources :neighborhoods
  resources :relationships
  resources :families
  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/sessions' => 'sessions#destroy'
  root 'families#index'
  get '/auth/facebook/callback' => 'sessions#facebook_create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
