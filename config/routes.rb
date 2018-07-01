Rails.application.routes.draw do
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/client/users/:id' => 'users#show'

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  get '/' => 'client/meetups#index'

  namespace :client do
    
    get  '/meetups' => 'meetups#index'
    get  '/meetups/new' => 'meetups#new'
    post '/meetups' => 'meetups#create'
    get  '/meetups/:id' => 'meetups#show'
    get  '/meetups/:id/edit' => 'meetups#edit'
    patch '/meetups/:id' => 'meetups#update'
    delete '/meetups/:id' => 'meetups#destroy'

  
    get '/events' => 'events#index'
    get '/events/new' => 'events#new'
    post '/events' => 'events#create'
    get '/events' => 'events#show'
    get '/events/:id/edit' => 'events#edit'
    patch '/events/:id' => 'events#update'
    delete '/events/:id' => 'events#destroy'

   
      get '/locations' => 'locations#index'
      get '/locations/new' => 'locations#new'
      post '/locations' => 'locations#create'
      get '/locations' => 'locations#show'
      get '/locations/:id/edit' => 'locations#edit'
      patch '/locations/:id' => 'locations#update'
      delete '/locations/:id' => 'locations#destroy'

      get '/attendances' => 'attendances#index'
      post '/attendances' => 'attendances#create'
      delete '/attendances/:id' => 'attendances#destroy'
  end
end
