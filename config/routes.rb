Rails.application.routes.draw do
  
  resources :users, only: [:show, :create] do 
    resources :filters, only: [:new, :create, :destroy]
  end

  #resources :filters, only: [:destroy]
  resources :sessions, only: [:destroy], as: :logout
  resources :messages, only: [:new, :index]
  get '/update-messages', to: 'messages#update', via: [:put, :patch], as: :update_messages
  get '/empty-user-messages', to: 'messages#empty_the_user_message_queue', via: [:put, :patch], as: :empty_the_user_message_queue
  get '/empty-filter-messages', to: 'messages#empty_the_filter_message_queue', via: [:put, :patch], as: :empty_filter_message_queue

  root 'home#index', as: 'home', layout: 'false'
  match 'auth/twitter/callback', to: 'sessions#create', via: [:get, :post]

 
end
