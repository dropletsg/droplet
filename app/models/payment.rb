class Payment < ApplicationRecord
  belongs_to :case
  has_many :payment_notes

  monetize :amount_cents
end
