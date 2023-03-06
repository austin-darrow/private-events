class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.hosted_events.build(event_params)

    if @event.save
      @event.attendances.create(user: current_user)
      redirect_to event_path(@event.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :location, :datetime)
  end
end
