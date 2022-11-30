class Application < ApplicationRecord
  belongs_to :user
  belongs_to :employer
  belongs_to :job

  validates :cv, presence: true
end
