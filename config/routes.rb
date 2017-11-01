Rails.application.routes.draw do
  get '/', to: 'welcome#show', as: 'home'
  get '/login', to: 'sessions#new', as: 'login'
  get '/dashboard', to: 'users#show', as: 'dashboard'
  resources :users, only: [:new, :create]
end