class EventsController < ApplicationController
  def index
     client_params = {
                     search: params[:search],
                     sort_by: params[:sort_by],
                     sort_order: params[:sort_order],
                     category: params[:category]
                    }
      response = Unirest.get(
                           "http://localhost:3000/api/events",
                           parameters: client_params
                           )
    @events = response.body
    render 'index.html.erb'
  end

  def new
    @event = {}
    render 'new.html.erb'
  end

  def create
    @event = {
                   'name' => params[:name],
                   'location' => params[:location],
                   'description' => params[:description]
                  
                  }

    response = Unirest.post(
                            "http://localhost:3000/api/events",
                            parameters: @event
                            )
  end

  def show
    event_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/events/#{event_id}")
    @event = response.body
    render 'show.html.erb'
  end

  def edit
    response = Unirest.get("http://localhost:3000/api/events/#{params[:id]}")
    @event = response.body
    render 'edit.html.erb'
  end

  def update
    @event = {
                   'name' => params[:name],
                   'location' => params[:location],
                   'description' => params[:description]
                  }

    response = Unirest.patch(
                              "http://localhost:3000/api/events/#{params[:id]}",
                              parameters: @event
                            )

    if response.code == 200
      flash[:success] = "Successfully updated Event"
      redirect_to "/client/events/#{params[:id]}"
    elsif response.code == 402
        flash[:warning] = "You are not Authorized"
    else
      @errors = response.body['errors']
      render 'edit.html.erb'
    end

    def destroy
      response = Unirest.delete("http://localhost:3000/api/events/#{params['id']}")
      if response.code == 200
      flash[:success] = "Successfully updated Event"
      redirect_to "/client/events"
      else
      flash[:warning] = "You are not Authorized"
      end
    flash[:success] = "Successfully destroyed Event"
    redirect_to "/client/events"
    end
  end
end

