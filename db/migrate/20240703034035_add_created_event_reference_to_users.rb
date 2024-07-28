class AddCreatedEventReferenceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :created_event, foreign_key: { to_table: :events }
  end
end
