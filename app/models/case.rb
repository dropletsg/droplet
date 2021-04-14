class Case < ApplicationRecord
  belongs_to :worker
  belongs_to :coordinator
  belongs_to :user
  has_many :payments
  has_many :case_notes
  has_one_attached :paid_proof
  has_many_attached :files
  monetize :target_amount_cents
  accepts_nested_attributes_for :worker, update_only: true

  validates_inclusion_of :status, in: %w[new shortlisted active closed archived]
  validates_numericality_of :target_amount, greater_than: 0
  validate :shortlisted_status_conditions, :active_status_conditions, :closed_status_conditions

  STATUS = %w[new shortlisted active closed archived]
  CATEGORIES = %w[medical agent_fee bills others]

  def current_amount
    payments.where(payment_type: "incoming").sum(&:amount)
  end

  def current_amount_cents
    return 0 if current_amount.zero?

    payments.where(payment_type: "incoming").sum(&:amount).cents
  end

  def calculate_progress
    amount_received = 500 # replace with payment received
    donation_progress = amount_received / target_amount.to_f * 100
    donation_progress.to_i
  end

  def shortlisted_status_conditions
    if status == 'shortlisted' && !shortlisted_status_ready?
      errors.add(:status, "can't be set to shortlisted: Need a coordinator assigned.")
    end
  end

  def active_status_conditions
    if status == 'active' && !active_status_ready?
      errors.add(:status, "can't be marked as active: Need to complete verification steps or get admin approval.")
    end
  end

  def closed_status_conditions
    if status == 'closed' && !closed_status_ready?
      errors.add(:status, "can't be closed: Need to upload proof of payment.")
    end
  end

  def new_status_ready?
    true
  end

  def shortlisted_status_ready?
    coordinator.present?
  end

  def active_status_ready?
    (call_done && worker.photo_id_front.attached? && worker.photo_id_back.attached? &&
    worker.id_selfie.attached? && worker.id_type.present? && worker.id_valid && worker.payment_link.present? &&
    worker.payment_qr.attached? && files.attached?) || admin_approved
  end

  def closed_status_ready?
    paid_proof.attached?
  end

  def archived_status_ready?
    true
  end

  def archived_status_ready?
    true
  end

  def active?
    status == 'active'
  end
end
