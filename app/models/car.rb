class Car < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :brand, :model, :mileage, :year, :body_type, :location, :price, :transmission, presence: true
  validates :mileage, :numericality => { :greater_than_or_equal_to => 0 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_car,
    against: [ :brand, :model ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
