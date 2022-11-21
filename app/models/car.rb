class Car < ApplicationRecord
  belongs_to :user
  validates :brand, :model, :color, :city, :price, :autonomy, :kilometreage, presence: true
end
