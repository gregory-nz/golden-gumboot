Rails.application.routes.draw do
  resources :users
  resources :surveys
  root 'surveys#index'
end
