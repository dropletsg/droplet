class Coordinator < ApplicationRecord
  has_many :cases
  has_one_attached :profile_photo

  validates_presence_of :name, :email, :mobile_number, :telegram_handle
  validates_format_of :mobile_number, with: /(\+65)?(6|8|9)\d{7}/
end
