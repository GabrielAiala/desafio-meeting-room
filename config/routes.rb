Rails.application.routes.draw do
  root 'sessions#new'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  resources :rooms, only: [:index, :new, :create]

  resources :sessions, only: [:destroy]
  resources :reservations, only: [:new, :create, :index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
