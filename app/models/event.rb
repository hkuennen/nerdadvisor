class Event < ApplicationRecord
  belongs_to :user
  has_one_attatched :photo
  has_many :attendees
end
