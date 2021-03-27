class Worker < ApplicationRecord
  has_many :cases
  has_many :case_notes
  has_one_attached :photo_id_front
  has_one_attached :photo_id_back
  has_one_attached :id_selfie
  has_one_attached :payment_qr
  validates :email, :name, :alias, :mobile_number, :description, :photo_id_front, :photo_id_back, :id_selfie, :id_type, :id_valid, :payment_link, :payment_qr, :is_archived, presence: true
end
