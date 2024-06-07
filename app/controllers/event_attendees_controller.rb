class EventAttendeesController < ApplicationController

  def new
    @event_attendee = EventAttendee.new
  end

  def create
    @event_attendee = @event.user.create_event_attendee

    if @event_attendee.save
      redirect_to event_path
    else
      render :new, status: :unprocessable_entity
    end
  end

end
