class Sms < ActiveRecord::Base
  belongs_to :app
  attr_accessible :body, :recipient_phone_id, :sender_phone_id, :sent_at

  def process
    app = App.find_by_code(app_code)
    app ||= App.find_by_code(sanitized_app_code)
    app.process(self) unless app.blank?
  end

  def app_code
    Sms.app_code(body)
  end

  def sanitized_app_code
    Sms.app_code(Sms.sanitize_for_codes(body))
  end

  def self.app_code(message_text)
    match = message_text.match(/^(\s*\S{1}){3}/)
    (match) ? match[0] : match
  end

  def self.sanitize_for_codes(message_text)
    message_text = message_text.downcase
    message_text = message_text.delete(' ')
    message_text = Message.replace_ambig_characters(message_text)
  end

  def self.replace_ambig_characters(message_text)
    # o => 0
    # i, l => 1
    # s => 5
    return message_text.gsub('o','0').gsub('i','1').gsub('l','1').gsub('s','5')
  end
end
