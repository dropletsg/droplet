class Case < ApplicationRecord
  belongs_to :worker
  belongs_to :coordinator
  belongs_to :user
  has_many :payments
  has_many :case_notes
  has_one_attached :paid_proof
  has_many_attached :files

  monetize :target_amount_cents
end
