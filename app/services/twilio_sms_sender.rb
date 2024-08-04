# app/services/twilio_sms_sender.rb
class TwilioSmsSender
  def initialize(to:, body:)
    @to = to
    @body = body
  end

  def call
    # client.messages.create(
    #   from: ENV['TWILIO_PHONE_NUMBER'],
    #   to: @to,
    #   body: @body
    # )
  end

  private

  def client
    @client ||= Twilio::REST::Client.new
  end
end
