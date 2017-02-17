task clock: :environment do
  while true
    if [0, 15, 30, 45].include?(Time.now.min)
      UserMailer.hello(Time.now).deliver_now
      p "sent at #{Time.now}"
    end
    sleep(1.minute)
  end
end