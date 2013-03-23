class Sms < ActiveRecord::Base
  belongs_to :app
  belongs_to :sender_phone, :class_name => "Phone"
  belongs_to :recipient_phone, :class_name => "Phone"

  attr_accessible :body, :recipient_phone_id, :sender_phone_id, :sent_at

  before_create :set_sent_at

  def set_sent_at
    self.sent_at ||= Time.now
  end

  def process
    app = App.find_by_code(app_code)
    app ||= App.find_by_code(sanitized_app_code)
    app.process(self) unless app.blank?
  end

  def app_code
    Sms.app_code(body)
  end

  def user_code
    match = Sms.sanitize_for_codes(self.body).match(/^(\s*\S{1}){9}/)
    (match) ? Code.find_by_code(match[0][3,6]) : match
  end

  def sanitized_app_code
    Sms.app_code(Sms.sanitize_for_codes(body))
  end

  def self.app_code(message_text)
    match = message_text.downcase.match(/^(\s*\S{1}){3}/)
    (match) ? match[0] : match
  end

  def self.sanitize_for_codes(message_text)
    message_text = message_text.downcase
    message_text = message_text.delete(' ')
    message_text = Sms.replace_ambig_characters(message_text)
  end

  def self.replace_ambig_characters(message_text)
    # o => 0
    # i, l => 1
    # s => 5
    return message_text.gsub('o','0').gsub('i','1').gsub('l','1').gsub('s','5')
  end

  def sender
    sender_phone.user
  end

  def recipient
    recipient_phone.user
  end

  def self.push(where, body)
    phone = where.default_phone if where.is_a? User
    phone ||= where

    Sms.create(
      sender_phone_id: Phone.movercado.id,
      recipient_phone_id: phone.id,
      body: body
    )

    #
    # Actual sending unimplemented
    # Get request to Kannel server
    #

  end

  def self.receive(sender_number, recipient_number, body, sent_at = Time.now)
    recipient_number ||= "Movercado"
    recipient_phone = Phone.find_or_initialize_by_number(recipient_number)
    receiver = recipient_phone.user
    receiver ||= recipient_phone.create_user
    recipient_phone.save

    sender_phone = Phone.find_or_initialize_by_number(sender_number)
    sender = sender_phone.user
    sender ||= sender_phone.create_user
    sender_phone.save

    create!(
      sender_phone_id: sender_phone.id,
      recipient_phone_id: recipient_phone.id,
      body: body,
      sent_at: sent_at
    ).process
  end
end
