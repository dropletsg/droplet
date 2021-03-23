class Coordinator < ApplicationRecord
  has_many :cases
  has_one_attached :profile_photo
end
