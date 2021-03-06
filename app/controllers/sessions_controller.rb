class SessionsController < ApplicationController
  def new
  render 'new.html.erb'
end

def create
  client_params = {
                   auth: {
                          email: params[:email],
                          password: params[:password]
                         }
                   }     

  response = Unirest.post(
                          "http://localhost:3000/user_token", 
                          parameters: client_params
                          )
  
  if response.code == 201
    session[:jwt] = response.body["jwt"]
    session[:user_id] = response.body["user"]["id"]

    flash[:success] = 'Successfully logged in!'
    redirect_to '/'
  else
    flash[:warning] = 'Invalid email or password!'
    redirect_to '/login'
  end
end

def destroy
  session[:jwt] = nil
  session[:user_id] = nil

  flash[:success] = 'Successfully logged out!'
  redirect_to '/login'
  end
end
