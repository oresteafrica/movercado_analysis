class Interaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :app
  attr_accessible :name
end
