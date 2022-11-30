class Employer < ApplicationRecord
  has_many :jobs
  has_many :applications
  has_one_attached :image

  validates :companyName, presence: true
  validates :recruiterEmail, presence: true
end
