namespace :emails do
desc "Update coordinators on off-track cases"
task :notify_coordinators  do
  # Filter all active cases
    puts "in the task!"
    active_cases = Case.where(status: "active")
    off_track_cases = []
    active_cases.each {|c| off_track_cases << c if c.off_track? }
    pp off_track_cases
    off_track_cases.each do |c|
      CoordinatorMailer.with(active_case: c).notification_email.deliver_now
      # EmailNotificationJob.perform_now(c)
    end
  end

end
