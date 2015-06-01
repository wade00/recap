desc "Send sms reminder to event participants"
task :send_sms => :environment do
  client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]

  participants = Participant.all

  participants.each do |participant|
    client.messages.create({
      from: ENV["TWILIO_PHONE"],
      to: particpant.phone,
      body: "Snap a pic of what's going on right now!"
    })
  end
end
