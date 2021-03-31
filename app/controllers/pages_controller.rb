class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :active_cases, :show ]

  def home
  end

  def active_cases
    if params[:category]
     @cases = Case.where('status = \'active\' AND category = :category', { category: params[:category] } )
    else
      @cases = Case.where(status: "active")
    end
  end

end
