class  Client::MeetupsController < ApplicationController
  def index
    client_params = {
                     meetup_id: params[:meetup_id],
                     name: params[:name],
                     start_time: params[:start_time],
                     end_time: params[:end_time]
                    }
    response = Unirest.get(
                           "http://localhost:3000/api/meetups",
                           parameters: client_params
                           )
    @products = response.body
    render 'index.html.erb'
  end

  def new
    @meetup = {}
    render 'new.html.erb'
  end

  def create
    @meetup = {
                   'name' => params[:name],
                   'start_time' => params[:start_time],
                   'end_time' => params[:end_time],
                   'description' => params[:description]
                  
                  }

    response = Unirest.post(
                            "http://localhost:3000/api/meetups",
                            parameters: @meetup
                            )
  end

  def show
    meetup_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/meetups/#{meetup_id}")
    @meetup = response.body
    render 'show.html.erb'
  end

  def edit
    response = Unirest.get("http://localhost:3000/api/meetups/#{params[:id]}")
    @meetup = response.body
    render 'edit.html.erb'
  end

  def update
      @meetup = {
                   'name' => params[:name],
                   'start_time' => params[:start_time],
                   'end_time' => params[:end_time],
                   # 'location' => params[:location],
                   # 'description' => params[:supplier_id]
                  }

    response = Unirest.patch(
                              "http://localhost:3000/api/meetups/#{params[:id]}",
                              parameters: @meetup
                            )

    if response.code == 200
      flash[:success] = "Successfully updated Product"
      redirect_to "/client/meetups/#{params[:id]}"
    elsif response.code == 402
        flash[:warning] = "You are not Authorized"
    else
      @errors = response.body['errors']
      render 'edit.html.erb'
    end
end

    def destroy
      response = Unirest.delete("http://localhost:3000/api/meetups/#{params['id']}")
      if response.code == 200
      flash[:success] = "Successfully updated Meetup"
      redirect_to "/client/meetups"
      else
      flash[:warning] = "You are not Authorized"
    end
    flash[:success] = "Successfully destroyed Meetup"
    redirect_to "/client/meetups"
    end
end
