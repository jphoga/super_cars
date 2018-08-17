class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :content, length: { minimum: 20 }
  validates :rating, presence: true
end
