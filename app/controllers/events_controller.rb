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

  def destroy

    @event = Event.find(params[:id])
    @event.destroy

    flash[:notice] = "event successfully deleted"
    redirect_to events_path

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
    @event_attendee = EventAttendee.find(params[:id])
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:date, :location)
  end

end
