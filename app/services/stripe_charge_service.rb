class StripeChargeService
  def call(event)
    charge = event.data.object
    Payment.create!(
      payment_reference: charge.metadata.payment_reference,
      currency: charge.currency,
      case_id: charge.metadata.case_id,
      payment_type: "incoming",
      amount_cents: charge.amount
    )
  end
end
