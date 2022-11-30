class Job < ApplicationRecord
  belongs_to :user
  belongs_to :employer
  has_many :applications

  validates :title, presence: true
  validates :_type, presence: true
end
