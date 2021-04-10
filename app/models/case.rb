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

  STATUS = %w[new shortlisted active closed archived]
  CATEGORIES = %w[medical agent_fee bills others]
  ID_TYPES = %w[work_permit s_pass employment_pass entre_pass dependents_pass passport]

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
