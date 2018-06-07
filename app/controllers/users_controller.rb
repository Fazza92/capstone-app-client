class UsersController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                      name: params[:name],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation]
                    }
    response = Unirest.post("http://localhost:3000/users",
                            parameters: client_params
                            )                  
  end
end
