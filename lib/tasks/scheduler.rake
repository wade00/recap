desc "Send sms reminder to event participants"
task :send_sms => :environment do
  client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]

  event = Event.last
  participants = event.participants

  participants.each do |participant|
    client.messages.create({
      from: ENV["TWILIO_PHONE"],
      to: participant.phone,
      body: "Let's document some shit. Go to: http://recapapp.herokuapp.com/events/1/memories/new"
    })
  end
end

desc "Send recap link to event participants"
task :send_recap => :environment do
  client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]

  event = Event.last
  participants = event.participants

  participants.each do |participant|
    client.messages.create({
      from: ENV["TWILIO_PHONE"],
      to: participant.phone,
      body: "Here's your morning recap, gents: http://recapapp.herokuapp.com/events/1/memories"
    })
  end
end
