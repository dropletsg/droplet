class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home active_cases show]

  def home
  end

  def active_cases
    @payment = Payment.new

    if params[:category]
      @cases = Case.where('status = \'active\' AND category = :category', { category: params[:category] })
    else
      @cases = Case.where(status: "active")
    end
  end
end
