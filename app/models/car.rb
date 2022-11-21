class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :brand, :model, :color, :city, :price, :autonomy, :kilometreage, presence: true
end
