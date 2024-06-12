class EventAttendeesController < ApplicationController

  def create
    @event_attendee = current_user.create_event_attendee

    if @event_attendee.save
      redirect_to event_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_attendee_params
    params.require(:event_attendee).permit(:event_id, current_user)
  end

end
