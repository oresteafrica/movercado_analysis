class KannelController < ApplicationController
  def entry_point
    sender_number = params[:sender]
    recipient_number = params[:receiver]
    sent_at = params[:time]
    body = params[:message]

    Sms.receive(sender_number, recipient_number, body, sent_at)

  end
end
