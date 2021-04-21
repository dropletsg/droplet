class CaseContributorsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  def new
    @case_contributor = CaseContributor.new
  end

  def create
    @case_contributor = CaseContributor.new(case_contributor_params.merge({ case_id: params[:case_id] }))
    @case_contributor.save!
    payment = Payment.find(params[:payment_id])
    payee_name = @case_contributor.name
    payee_name.present? ? payment.update(payee_name: payee_name) : payment.update(payee_name: "Anonymous")
    redirect_to active_cases_path(@case_contributor.case)
  end

  private

  def case_contributor_params
    params.require(:case_contributor).permit(:name, :email)
  end

end
