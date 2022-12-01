class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship

  validates :start_time, :end_time, presence: true
end
