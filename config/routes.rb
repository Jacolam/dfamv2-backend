Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      post '/logs', to: 'logs#create'
      get '/profile', to: 'users#profile'
      get '/contacts', to: 'users#contacts'
      get '/events', to: 'events#index'
      # for development
      get '/logs', to: 'logs#index'
      get '/users', to: 'users#index'
    end
  end
end
