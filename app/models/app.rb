class App < ActiveRecord::Base
  attr_accessible :name, :type, :code

  validates :name, :code,
    uniqueness: true,
    presence: true

  before_save :downcase_code

  def self.types
    %w[IpcValidation TrocaAkiValidation]
  end

  def to_s
    "#{name} (#{code})"
  end

  def downcase_code
    self.code = self.code.downcase
  end
end
