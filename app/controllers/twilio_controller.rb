require 'twilio-ruby'

class TwilioController < ApplicationController
  def text
    if Rails.env.production?
      @client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"],
                                         ENV["TWILIO_AUTH_TOKEN"]
    else
      @client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid,
                                         Rails.application.secrets.twilio_auth_token
    end

    @client.messages.create({
      from: '+17089720240',
      to: '+17082143045',
      body: 'Hello!'
    })
  end
end
