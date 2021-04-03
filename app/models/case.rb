class Case < ApplicationRecord
  belongs_to :worker
  belongs_to :coordinator
  belongs_to :user
  has_many :payments
  has_many :case_notes
  has_one_attached :paid_proof
  has_many_attached :files

  monetize :target_amount_cents
  

  STATUS = ["new","shortlisted","active","closed"]

  CATEGORY = ["medical","agent_fees","bills","others"]

  def total_received
    #payments.reduce
  end

  def calculate_progress
    amount_received = 500 # replace with payment received 
    donation_progress = amount_received / target_amount.to_f * 100
    donation_progress.to_i
  end
end
