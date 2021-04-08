class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show create success]

  def show
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
      success_url: success_payment_url(payment),
      cancel_url: success_payment_url(payment),
      payment_intent_data: {
        metadata: {
          payment_id: payment.id,
          case_id: payment.case.id
        }
      }
    )

    payment.update(checkout_session_id: session.id)
    redirect_to payment_path(payment)
  end

  def success
    @payment = Payment.find(params[:id])
    @case_contributor = CaseContributor.new
  end

  private

  def payment_params
    params.require(:payment).permit(:amount)
  end

end
