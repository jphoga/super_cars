class Car < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :brand, :model, :mileage, :year, :body_type, :location, :price, :transmission, presence: true
  mount_uploader :photo, PhotoUploader
end
