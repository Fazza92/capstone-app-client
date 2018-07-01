class Client::AttendancesController < ApplicationController

  def index
    response = Unirest.get("http://localhost:3000/api/attendances")
    @attendances = response.body

    render 'index.html.erb'
  end

  def create
    client_params = {
                      user_id: params[:user_id],
                      meetup_id: params[:meetup_id],
                      status: "Going to attend"
                    }

    response = Unirest.post("http://localhost:3000/api/attendances", parameters: client_params)
    
    @attendance = response.body
    redirect_to "/client/users/#{params[:user_id]}"                
  end

  def destroy
    attendance_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/attendances/#{attendance_id}")
    redirect_to "/client/attendances"
  end
end
