class EventAttendeesController < ApplicationController

  def new
    @event_attendee = EventAttendee.new
  end

  def create
    @event = Event.find(params[:event_id])

    @event_attendee = @event.event_attendees.build(attendee_id: current_user.id)

    if @event_attendee.save!
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event_attendee = EventAttendee.find(params[:id])
  end

  def destroy
    @event_attendee = EventAttendee.find(params[:id])

    @event_attendee.destroy

    redirect_to events_path, notice: "attendee was deleted"
  end

  def index
    @event = Event.find(params[:id])
    @event_attendees = EventAttendee.all
  end

  private

  def event_attendee_params
    params.require(:event_attendee).reverse_merge(attendence: true).permit(:attendence, :attendee_id, :attended_event_id)
  end

end

#Resource used to build destory method
#https://utahedu.devcamp.com/sie2017/guide/building-ability-delete-items-rails

#Resource on how to create a button in ruby rails
#https://www.geeksforgeeks.org/how-to-create-button-in-ruby-on-rails/

#How to add sign out functionality
#https://dev.to/jolouie7/how-to-create-a-login-and-logout-with-devise-6b9