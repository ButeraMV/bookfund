Rails.application.routes.draw do
  root to: 'welcome#show'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/dashboard', to: 'users#show', as: 'dashboard'
  get 'thanks', to: 'charges#new', as: 'thanks'
  get '/backing/:id', to: 'ebooks#backing', as: 'ebooks_backing'
  post '/backing/charge/', to: 'charges#ebook_backing_stripe', as: 'ebook_backing_stripe'
  get '/auth/twitter/callback', to: 'sessions#oauth_login'
  resource :cart
  resources :charges, only: [:create]
  resources :ebooks, only: [:index, :show, :new, :create]
  resources :orders, only: [:index]
  resources :users, only: [:new, :create]
  resources :categories, only: [:index, :show]
  namespace :users do
    resources :authors, only: [:index, :create, :show]
    resources :ebooks, only: [:show]
    namespace :authors do
      resources :ebooks, only: [:new, :create, :show, :edit, :update]
    end
  end
  namespace :admin do
    get "/dashboard", to: "users#show", as: "dashboard"
  end
end