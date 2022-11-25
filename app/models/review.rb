class Review < ApplicationRecord
  AUTHORIZED_RATINGS = (1..5)
  belongs_to :car
  belongs_to :user

  validates :content, :rating, :title, presence: true
  validates :rating, inclusion: { in: AUTHORIZED_RATINGS }
end
