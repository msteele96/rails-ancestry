Rails.application.routes.draw do
  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/sessions' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
