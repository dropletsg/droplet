class Worker < ApplicationRecord
  has_many :cases
  has_many :case_notes
  has_one_attached :photo_id_front
  has_one_attached :photo_id_back
  has_one_attached :id_selfie
  has_one_attached :payment_qr
  validates :email, :name
end
