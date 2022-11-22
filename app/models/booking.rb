class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  # validates :car_id, uniqueness: { scope: :user_id }
  attribute :status, :string, default: "pending"
end
