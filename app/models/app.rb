class App < ActiveRecord::Base
  attr_accessible :name, :type, :code

  validates :name, :code,
    uniqueness: true,
    presence: true

  def self.types
    %w[IpcValidation TrocaAkiValidation]
  end

  def to_s
    "#{name} (#{code})"
  end
end
