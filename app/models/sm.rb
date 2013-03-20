class Sm < ActiveRecord::Base
  belongs_to :app
  attr_accessible :body, :recipient_phone_id, :sender_phone_id, :sent_at
end
