class Employer < ApplicationRecord
  has_many :jobs
  has_many :applications

  validates :companyName, presence: true
  validates :recruiterEmail, presence: true
end
