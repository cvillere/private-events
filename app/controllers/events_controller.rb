class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :index] 

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to event_path
    else
      render :edit
    end

  end

  def delete

    @event = Event.find(params[:id])
    @event.delete

    redirect_to events_path, notice: "event was successfully deleted"

  end



  def create
    
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show 
    @event = Event.find(params[:id])
    @event_attendees = EventAttendee.all
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:date, :location)
  end

end
