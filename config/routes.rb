Rails.application.routes.draw do
  
  root 'home#index', as: 'home', layout: 'false'

  resources :users, only: [:show, :create] do 
    resources :filters, only: [:new, :create, :destroy]
    resources :messages, only:[:create]
  end

  resources :sessions, only: [:destroy], as: :logout
  resources :messages, only: [:new, :index, :create]
  get '/update-messages', to: 'messages#update', via: [:put, :patch], as: :update_messages
  get '/analyze-tweets', to: 'filters#analyze_tweets', as: :analyze_tweets
  get '/empty-user-messages', to: 'messages#empty_the_user_message_queue', via: [:put, :patch], as: :empty_the_user_message_queue
  get '/empty-filter-messages', to: 'messages#empty_the_filter_message_queue', via: [:put, :patch], as: :empty_filter_message_queue

  match 'auth/twitter/callback', to: 'sessions#create', via: [:get, :post]

 
end
