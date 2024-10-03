class Review < ApplicationRecord
  belongs_to :car
  validates :comment, presence: true, length: { minimum: 8 }
  validates :rating, inclusion: { in: 1..5 }
  validates :car_id, uniqueness: true
end
