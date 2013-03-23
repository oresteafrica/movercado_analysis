class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :roles
  has_many :interactions
  has_many :codes
  has_many :phones

  attr_accessible :roles_attributes

  accepts_nested_attributes_for :roles

  def default_phone
    (phones.blank?) ? Phone.create(number: SecureRandom.hex) : phones.first
  end

  def interacted?(app)
    self.interactions.where(app_id: app.id).present?
  end

  def vendor?(app)
    has_role?(app, "vendor")
  end

  def activista?(app)
    has_role?(app, "activista")
  end

  def has_role?(app, role_name)
    self.roles.where(app_id: app.id, name: role_name).present?
  end

  def to_s
    "#{self.id}"
  end
end
