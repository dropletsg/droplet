class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show create success]
  attr_accessor :case

  def show
    @payment = Payment.where(payment_type: 'pending').find(params[:id])
  end

  def create
    if params[:payment_type] == "outgoing"
      @payment = Payment.new(payment_params.merge({ payment_type: params[:payment_type] }))
      @case = Case.find(params[:case_id])
      @payment.case = @case

      if @payment.save!
        @payment.case.update_target_amount
        redirect_to cases_path
      else
        redirect_to cases_path
      end
    else
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
  end

  def success
    @payment = Payment.find(params[:id])
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :payment_reference, :payment_type)
  end
end
