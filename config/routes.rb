Rails.application.routes.draw do
  
  root 'home#index', as: 'home', layout: 'false'
  match 'auth/twitter/callback', to: 'sessions#create', via: [:get, :post]

  ### CRUD
  resources :users, only:[:show,:create]
end
