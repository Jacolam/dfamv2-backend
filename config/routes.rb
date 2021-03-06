Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      post '/logs', to: 'logs#create'
      get '/profile', to: 'users#profile'
      get '/profile/edit', to: 'users#edit'
      post '/addperson', to: 'contacts#create'
      get '/contacts', to: 'contacts#index'
      patch "/contacts/update", to: 'contacts#update'
      patch '/logs/:id', to: 'logs#complete'
      patch '/logs', to: 'logs#update'
      patch '/user/update', to: 'users#update_profile'
      delete '/logs/:id', to: 'logs#destroy'
      delete '/user/delete', to: 'users#destroy'
      get '/events', to: 'events#index'
      get '/people', to: 'users#unadded'
      delete '/removecontact', to: 'contacts#destroy'
      # for development
      # get '/logs', to: 'logs#index'
      # get '/users', to: 'users#index'
    end
  end
end
