Rails.application.routes.draw do
  root to: 'welcome#show'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/dashboard', to: 'users#show', as: 'dashboard'
  resource :cart
  resources :users, only: [:new, :create]
  resources :ebooks, only: [:index]
end