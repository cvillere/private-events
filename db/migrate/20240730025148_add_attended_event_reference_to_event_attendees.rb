class AddAttendedEventReferenceToEventAttendees < ActiveRecord::Migration[7.1]
  def change
    add_reference :event_attendees, :attended_event, foreign_key: { to_table: :events }
  end
end
