class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :active_cases, :show ]

  def home
  end

  def active_cases
    @cases = Case.where(status: "active")
    @payment = Payment.new
  end

end
