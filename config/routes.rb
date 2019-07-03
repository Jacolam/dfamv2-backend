Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      post '/logs', to: 'logs#create'
      get '/profile', to: 'users#profile'
      post '/addperson', to: 'contacts#create'
      get '/contacts', to: 'contacts#index'
      # patch "/contacts/:id", to: 'contacts#update'
      patch '/logs/:id', to: 'logs#update'
      delete '/logs/:id', to: 'logs#destroy'
      get '/events', to: 'events#index'
      get '/people', to: 'users#unadded'
      delete '/removecontact', to: 'contacts#destroy'
      # for development
      get '/logs', to: 'logs#index'
      get '/users', to: 'users#index'
    end
  end
end
