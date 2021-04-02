class StripeCheckoutSessionService
  def call(event)
    payment_intent = Stripe::PaymentIntent.retrieve(event.data.object.payment_intent)
    return unless payment_intent.status == 'succeeded'

    payment = Payment.find_by(checkout_session_id: event.data.object.id)
    payment.update(payment_type: "incoming")
  end
end
