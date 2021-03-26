class Coordinator < ApplicationRecord
  has_many :cases
  has_one_attached :profile_photo
  validates :name, :email, :mobile_number, :telegram_handle, presence: true

end
