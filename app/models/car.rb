class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  validates :brand, :model, :mileage, :year, :body_type, :location, :price, :transmission, presence: true
  mount_uploader :photo, PhotoUploader
end
