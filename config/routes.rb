Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/contacts', to: 'users#contacts'
      get '/events', to: 'events#index'
    end
  end
end
