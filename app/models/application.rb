class Application < ApplicationRecord
  belongs_to :user
  belongs_to :employer
  belongs_to :job
  has_one_attached :cv
  has_one_attached :coverLetter

  # validates :cv, presence: true
end
