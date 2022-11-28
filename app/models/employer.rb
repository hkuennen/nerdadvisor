class Employer < ApplicationRecord
  belongs_to :job, through: :users
  has_many :applications

  validates :companyName, presence: true
  validates :recruiterEmail, presence: true
end
