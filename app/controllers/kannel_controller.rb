class KannelController < ApplicationController
  def entry_point
    sender_number = params[:sender]
    recipient_number = params[:receiver]
    sent_at = params[:time]
    sent_at ||= Time.now
    body = params[:message]

    recipient_number ||= "Movercado"
    recipient_phone = Phone.find_or_create_by_number(recipient_number)
    receiver = recipient_phone.user
    receiver ||= recipient_phone.create_user

    sender_phone = Phone.find_or_create_by_number(sender_number)
    sender = sender_phone.user
    sender ||= sender_phone.create_user

    Sms.create!(
      sender_phone_id: sender_phone.id,
      recipient_phone_id: recipient_phone.id,
      body: body,
      sent_at: sent_at
    ).process
  end
end
