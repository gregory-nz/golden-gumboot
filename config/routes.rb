Rails.application.routes.draw do
  resources :users, except: [:new, :index]
  resources :surveys, except: :index
  root 'surveys#index'

  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  get     '/signup',  to: 'users#new'
end
