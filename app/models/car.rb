class Car < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
  validates :brand, :model, :color, :city, :price, :autonomy, :kilometreage, presence: true
end
