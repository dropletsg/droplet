class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home active_cases active_cases_show]

  def home
    redirect_to cases_path if user_signed_in?
  end

  def active_cases
    @payment = Payment.new

    if params[:category]
      @cases = Case.where('status = \'active\' AND category = :category', { category: params[:category] })
    else
      @cases = Case.where(status: "active")
    end

    @category = params[:category]
  end

  def active_cases_show
    @payment = Payment.new
    @case = Case.find(params[:id])
    @contributions = Payment.where(case_id: @case, payment_type: "pending")
    @num_of_contributors = @contributions.size
    @num_of_subscribers = CaseContributor.where(case_id: @case).size
  end
end
