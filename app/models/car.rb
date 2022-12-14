class Car < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :brand, :model, :color, :city, :price, :autonomy, :kilometreage, presence: true
  #ajout de Géocoder (vic)
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  include PgSearch::Model
    pg_search_scope :search,
    against: [ :brand, :model, :color, :city, :autonomy, :price, :kilometreage ],
    using: {
      tsearch: { prefix: true }
    }

  def average_rate
    return 0 if reviews.count == 0
    sum = 0
    reviews.each do |review|
      sum += review.rating
    end
    sum / reviews.count
  end
end
