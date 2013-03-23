class Interaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :app
  attr_accessible :name, :user_id, :app_id
end
