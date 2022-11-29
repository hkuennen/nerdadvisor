class Employer < ApplicationRecord
  has_many :job
  has_many :applications

  validates :companyName, presence: true
  validates :recruiterEmail, presence: true
end
