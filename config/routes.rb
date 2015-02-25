Rails.application.routes.draw do
  
  resources :users, only: [:show, :create] do 
    resources :filters, only: [:new,:create]
  end


  resources :filters, only: [:create]
  resources :sessions, only: [:destroy], as: :logout
  resources :messages, only: [:new, :create, :index, :destroy]
  #resources :users, only: [:show, :create]

  root 'home#index', as: 'home', layout: 'false'
  match 'auth/twitter/callback', to: 'sessions#create', via: [:get, :post]

 
end
