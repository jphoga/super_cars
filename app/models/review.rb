class Review < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :content, :rating, presence: true
end
