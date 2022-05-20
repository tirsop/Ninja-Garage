class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  validates :start_date, presence: true
  validates :return_date, presence: true
  validates :status, presence: true
  validate :check_dates
  enum status: { pending: 0, accepted: 1, rejected: 2 }

  def check_dates
    errors.add(:return_date, "End date should be before start date") if return_date < start_date
  end
end
