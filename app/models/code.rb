class Code < ActiveRecord::Base
  belongs_to :user
  belongs_to :app
  attr_accessible :code, :user_id, :app_id

  before_create :fill_code

  def inc_usage
    self.times_used += 1
    self.save
  end

  def self.gen
    code = ""
    6.times do
      r = rand(36)
      if r >= 10
        c = (55+r).chr
      else
        c = r.to_s
      end
      code << c
    end
    code = Sms.replace_ambig_characters(code.downcase)
    if Code.find_by_code(code)
      generate_code
    else
      return code.downcase
    end
  end

  def to_s
    "#{app.code}#{code}".upcase
  end

  def fill_code
    self.code ||= Code.gen
  end
end
