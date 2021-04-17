require "test_helper"

class EmailNotificationJobTest < ActiveJob::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:one)
  end

  test 'notification_email' do
    email = CoordiantorMailer.notification_email(active_case)
    assert_emails 1 do
      email.deliver
    end

    assert_equal email.to, [@active_case.coordinator.email]
    assert_equal email.from, ['testdropletproject@gmail.com']
    assert_equal email.subject, "Case #{@active_case.id} is off-track"

  end
end
end
