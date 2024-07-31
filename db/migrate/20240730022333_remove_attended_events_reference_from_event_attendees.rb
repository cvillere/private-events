class RemoveAttendedEventsReferenceFromEventAttendees < ActiveRecord::Migration[7.1]
  def change
    remove_reference :event_attendees, :attended_event, foreign_key: { to_table: :events}
  end
end
