Rails.application.routes.draw do
  get "/signup" => "users#new"
  post "/users" => "users#create"

  get '/' => 'client/meetups#index'
  # namespace :client do
    get  '/client/meetups' => 'meetups#index'
    get  '/client/meetups/new' => 'meetups#new'
    post '/client/meetups' => 'meetups#create'
    get  '/client/meetups/:id' => 'meetups#show'
    get  '/client/meetups/:id/edit' => 'meetups#edit'
    patch '/client/meetups/:id' => 'meetups#update'
    delete '/client/meetups/:id' => 'meetups#destroy'
  
    get '/client/events' => 'events#index'
    get '/client/events' => 'events#new'
    post '/client/events' => 'events#create'
    get '/client/events' => 'events#show'
    get '/client/events/:id/edit' => 'events#edit'
    patch '/client/events/:id' => 'events#update'
    delete '/client/events/:id' => 'events#destroy'

    get '/client/locations' => 'locations#index'
    get '/client/locations' => 'locations#new'
    post '/client/locations' => 'locations#create'
    get '/client/locations' => 'locations#show'
    get '/client/locations/:id/edit' => 'locations#edit'
    patch '/client/locations/:id' => 'locations#update'
    delete '/client/locations/:id' => 'locations#destroy'
end
