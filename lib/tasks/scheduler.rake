desc "Hit Twilio alert route"
task :send_sms => :environment do
  get "twilio/text" => "twilio#text"
end
