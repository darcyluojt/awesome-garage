class Car < ApplicationRecord
  belongs_to :owner
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :brand, :model, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1900 }
end
