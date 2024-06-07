class AddAttendenceToEventAttendees < ActiveRecord::Migration[7.1]
  def change
    add_column :event_attendees, :attendence, :string
  end
end
