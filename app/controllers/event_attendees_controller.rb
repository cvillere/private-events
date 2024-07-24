class EventAttendeesController < ApplicationController

  def create
    @event_attendee = current_user.event_attendee.build(:event_attendee_params)

    if @event_attendee.save
      redirect_to event_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_attendee_params
    params.require(:event_attendee).permit(:attendence)
  end

end
