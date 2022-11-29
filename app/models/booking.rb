class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship

  validates :date, presence: true
end
