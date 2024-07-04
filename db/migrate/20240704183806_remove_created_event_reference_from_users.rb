class RemoveCreatedEventReferenceFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :users, :created_event, foreign_key: { to_table: :events}
  end
end
