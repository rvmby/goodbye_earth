class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :booking, dependent: :destroy

 # validates :description, presence: true
  #validates :name, presence: true
 # validates :max_people, presence: true
  #validates :price, presence: true
end
