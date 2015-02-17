Rails.application.routes.draw do
  
  resources :filters, only: [:new,:create,:index,:destroy]
  resources :sessions, only: [:destroy], as: :logout

  resources :messages

  root 'home#index', as: 'home', layout: 'false'
  match 'auth/twitter/callback', to: 'sessions#create', via: [:get, :post]

  ### CRUD
  resources :users, only: [:show, :create]
  
end
