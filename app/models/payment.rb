class Payment < ApplicationRecord
  belongs_to :case
  has_many :payment_notes

  monetize :amount_cents

  validates_numericality_of :amount, greater_than: 0
end
