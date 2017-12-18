module SmsTool
  def self.send_sms(number, message)
    puts "Sending SMS..."
    puts "'#{message}' to #{number.to_s}"
  end
end
