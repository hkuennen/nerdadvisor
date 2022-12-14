class User < ApplicationRecord
  has_many :jobs
  has_many :applications
  has_many :events, dependent: :destroy
  has_one_attached :image

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
