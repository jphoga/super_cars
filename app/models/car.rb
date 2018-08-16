class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  validates :brand, :model, :mileage, :year, :body_type, :location, :price, :transmission, presence: true
  validates :mileage, :numericality => { :greater_than_or_equal_to => 0 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch
  pg_search_scope :search_by_car,
    against: [ :brand, :model, :location ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def unreviewed_bookings
    bookings.where.not(id: reviews.pluck(:booking_id).uniq)
  end
end
