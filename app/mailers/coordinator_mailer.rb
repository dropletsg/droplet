class CoordinatorMailer < ApplicationMailer
  default from: 'testdropletproject@gmail.com'

  def notification_email
    @active_case = params[:active_case]
    mail(to: @active_case.coordinator.email, subject: "Case #{@active_case.id} is off-track")
  end
end
