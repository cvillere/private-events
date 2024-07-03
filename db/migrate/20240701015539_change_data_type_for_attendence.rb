class ChangeDataTypeForAttendence < ActiveRecord::Migration[7.1]
  def change
    change_column(:event_attendees, :attendence, :boolean)
  end
end
