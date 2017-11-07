Rails.application.routes.draw do
  root to: 'welcome#show'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/dashboard', to: 'users#show', as: 'dashboard'
  get 'thanks', to: 'charges#new', as: 'thanks'
  resource :cart
  resources :charges, only: [:create]
  resources :ebooks, only: [:index, :show, :new, :create]
  resources :orders, only: [:index]
  resources :users, only: [:new, :create]
  resources :categories, only: [:index, :show]
  namespace :users do
    resources :authors, only: [:index, :create, :show]
    namespace :authors do
      resources :ebooks, only: [:new, :create, :show, :edit, :update]
    end
  end
end