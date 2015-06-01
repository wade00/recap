desc "Hit Twilio alert route"
task :send_sms => :environment do
  client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]

  client.messages.create({
    from: '+17089720240',
    to: '+17082143045',
    body: 'Hello!'
  })
end
