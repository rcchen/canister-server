Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/authenticate', to: 'users#authenticate'
      get '/users', to: 'users#index'
      post '/users', to: 'users#create'
      resources :photos
      resources :tags
      resources :tokens
    end
  end
end
