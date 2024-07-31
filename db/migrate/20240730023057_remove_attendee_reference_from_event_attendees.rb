class RemoveAttendeeReferenceFromEventAttendees < ActiveRecord::Migration[7.1]
  def change
    remove_reference :event_attendees, :attendee, foreign_key: { to_table: :users }
  end
end
