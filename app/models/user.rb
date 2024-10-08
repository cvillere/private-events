class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_attendees, foreign_key: :attendee_id
  has_many :events, inverse_of: "creator"
  has_many :attended_events, through: :event_attendees

end