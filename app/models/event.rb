class Event < ApplicationRecord
  
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
  has_many :attendees, through: :event_attendees, source: :event_attendee

  scope :past, -> { where("past < ?", Date.today) }
  scope :upcoming, -> { where("upcoming > ?", Date.today) }

=begin
  def self.past
    where("past < ?", Date.today)

  end

  def self.upcoming
    where("upcoming > ?", Date.today)
  end
=end

end
