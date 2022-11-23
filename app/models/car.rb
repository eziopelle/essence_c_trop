class Car < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :brand, :model, :color, :city, :price, :autonomy, :kilometreage, presence: true
  #ajout de Géocoder (vic)
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
