class Worker < ApplicationRecord
  has_many :cases
  has_many :worker_notes
  has_one_attached :photo_id_front
  has_one_attached :photo_id_back
  has_one_attached :id_selfie
  has_one_attached :payment_qr

  accepts_nested_attributes_for :cases
  validates_presence_of :name, :alias, :mobile_number
  validates_format_of :mobile_number, with: /(\+65)?(6|8|9)\d{7}/
  validates_inclusion_of :id_type, in: %w[work_permit s_pass employment_pass passport others]

  ID_TYPES = %w[work_permit s_pass employment_pass passport others]
end
