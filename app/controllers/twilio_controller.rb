require 'twilio-ruby'

class TwilioController < ApplicationController
  def text
    @client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid,
                                       Rails.application.secrets.twilio_auth_token

    @client.messages.create({
      from: '+17089720240',
      to: '+17082143045',
      body: 'Hello!'
    })
  end
end
