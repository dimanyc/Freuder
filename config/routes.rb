Rails.application.routes.draw do
  
  resources :filters

  resources :messages

  root 'home#index', as: 'home', layout: 'false'
  match 'auth/twitter/callback', to: 'sessions#create', via: [:get, :post]

  ### CRUD
  resources :users, only:[:show,:create]
  
end
