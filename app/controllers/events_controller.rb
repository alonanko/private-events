class EventsController < ApplicationController
  before_action :logged_in_user, only:[:create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if current_user.events << @event
      flash[:success] = "Event Created"
      redirect_to events_path
    else
      flash[:now] = "invalid event info"
      render 'new'
    end
  end

  def event_params
    params.require(:event).permit(:title, :location)
  end
end
