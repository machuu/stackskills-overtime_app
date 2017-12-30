namespace :notification do
  desc "Sends SMS Notification to employees, asking them to log if they have overtime or not"
  task sms: :environment do
    # 1. Schedule to run at Sunday at 5PM
    # 2. Iterate over all employees
    # 3. Skip Admin Users
    # 4. Send a message with instructions and a link to log time
  end

end
