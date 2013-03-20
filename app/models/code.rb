class Code < ActiveRecord::Base
  belongs_to :user
  belongs_to :app
  attr_accessible :code
end
