class Phone < ActiveRecord::Base
  belongs_to :user
  attr_accessible :number

  validates :number,
    uniqueness: true

  def self.movercado
    find_or_create_by_number("Movercado")
  end
end
