class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :app
  attr_accessible :name, :app_id, :user_id

  def self.roles
    %w[vendor activista]
  end
end
