class PaymentsController < ApplicationController
  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.where(payment_type: 'pending').find(params[:id])
  end

  def create
    payment = Payment.create!(
      payment_params.merge(
        {
          payment_reference: "stripe_#{params[:case_id]}",
          case: Case.find(params[:case_id]),
          payment_type: 'pending'
        }
      )
    )

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: 'contribution',
        amount: payment.amount.to_i * 100,
        currency: 'sgd',
        quantity: 1
      }],
      success_url: payment_url(payment),
      cancel_url: payment_url(payment)
    )

    payment.update(checkout_session_id: session.id)
    redirect_to new_payment_path(payment)
  end

  private

  def payment_params
    params.require(:payment).permit(:amount)
  end
end
