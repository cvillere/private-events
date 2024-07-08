class AddAttendeeReferenceToUEventAttendees < ActiveRecord::Migration[7.1]
  def change
    add_reference :event_attendees, :attendee, null: false, foreign_key: { to_table: :users }
  end
end
