class Review < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  validates :content, presence: true
  RATINGS = [1, 2, 3, 4, 5]
  validates :rating, presence: true, inclusion: { in: RATINGS }, numericality: { only_integer: true }
end
