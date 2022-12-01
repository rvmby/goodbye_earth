class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship

  validates :start_time, :end_time, presence: true

  enum status: { pending: 0, processing_payment: 1, confirmed: 2, cancelled: -1 }
end
