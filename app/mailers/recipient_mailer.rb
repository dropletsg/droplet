class recipientMailer < ActionMailer::Base

  # default from: "notification@example.com"

  # def subscribe_confirmation(recipient)
  #   @recipient = recipient
  #   mail(to: recipient.email, subject: "You are subscribed to case #{@case.id}")
  # end

  # default bcc: { Admin.pluck(:email) }

  # def self.send_update
  #   emails = ['email1@mysite.com', 'email2@another.com']
    
  #   emails.each do |email|
  #     new_update(email).deliver_later!(wait_until: @case.target_amount)
  #   end
  # end
  
  # def new_update(@case)
  #   @case = case
  #   mail(to: email, subject: "Update on case #{@case.id}")
  # end

end
