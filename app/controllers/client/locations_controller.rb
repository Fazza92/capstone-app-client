class Client::LocationsController < ApplicationController
  def index
     client_params = {
                     search: params[:search],
                     sort_by: params[:sort_by],
                     sort_order: params[:sort_order],
                     category: params[:category]
                    }
      response = Unirest.get(
                           "http://localhost:3000/api/locations",
                           parameters: client_params
                           )
    @locations = response.body
    render 'index.html.erb'
  end

  def new
    @location = {}
    render 'new.html.erb'
  end

  def create
    @location = {
                   'name' => params[:name],
                   'longitude' => params[:longitude],
                   'latitude' => params[:latitude]
                  
                  }

    response = Unirest.post(
                            "http://localhost:3000/api/locations",
                            parameters: @location
                            )

    if response.code == 200
      redirect_to '/client/locations'
    elsif response.code == 401
      redirect_to '/client/locations/1'
    else
      @errors = response.body['errors']
      render 'new.html.erb'
    end

  end

  def show
    location_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/locations/#{location_id}")
    @location = response.body
    render 'show.html.erb'
  end

  def edit
    response = Unirest.get("http://localhost:3000/api/locations/#{params[:id]}")
    @location = response.body
    render 'edit.html.erb'
  end

  def update
    @location = {
                   'name' => params[:name],
                   'longitude' => params[:longitude],
                   'latitude' => params[:latitude]
                  }

    response = Unirest.patch(
                              "http://localhost:3000/api/locations/#{params[:id]}",
                              parameters: @location
                            )

    if response.code == 200
      flash[:success] = "Successfully updated Location"
      redirect_to "/client/locations/#{params[:id]}"
    elsif response.code == 402
        flash[:warning] = "You are not Authorized"
    else
      @errors = response.body['errors']
      render 'edit.html.erb'
    end

    def destroy
      response = Unirest.delete("http://localhost:3000/api/locations/#{params['id']}")
      if response.code == 200
      flash[:success] = "Successfully destroyed Location"
      # redirect_to "/client/locations"
      else
      flash[:warning] = "You are not Authorized"
      end
    redirect_to "/client/locations"
    end
  end
end
