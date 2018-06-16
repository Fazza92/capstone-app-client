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
  
    get '/events' => 'events#index'
    get '/events' => 'events#new'
    post '/events' => 'events#create'
    get '/events' => 'events#show'
    get '/events/:id/edit' => 'events#edit'
    patch '/events/:id' => 'events#update'
    delete '/events/:id' => 'events#destroy'
end
