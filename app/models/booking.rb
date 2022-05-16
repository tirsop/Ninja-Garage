class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  validates :start_date, presence: true
  validates :return_date, presence: true
  validates :status, presence: true
  enum :status, { pending: 0, accepted: 1, rejected: 2 }
end
