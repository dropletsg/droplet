class Payment < ApplicationRecord
  belongs_to :case
  has_many :payment_notes
end
