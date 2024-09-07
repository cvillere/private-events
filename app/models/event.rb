class Event < ApplicationRecord
  
  has_many :event_attendees, foreign_key: :attended_event_id
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  has_many :attendees, through: :event_attendees, source: :attendee


  scope :past, -> { where("date < ?", Date.today) }
  scope :upcoming, -> { where("date > ?", Date.today) }


  #def self.past
   # where("past < ?", Date.today)
  # end

  # def self.upcoming
    # where("upcoming > ?", Date.today)
  # end


end
