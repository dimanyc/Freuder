Rails.application.routes.draw do
  
  resources :users, only: [:show, :create] do 
    resources :filters, only: [:new, :create, :destroy]
  end

  resources :filters, only: [:destroy]
  resources :sessions, only: [:destroy], as: :logout
  resources :messages, only: [:new, :create, :index, :destroy]
  get '/update-messages', to: 'messages#update', via: [:put, :patch], as: :update_messages

  root 'home#index', as: 'home', layout: 'false'
  match 'auth/twitter/callback', to: 'sessions#create', via: [:get, :post]

 
end
