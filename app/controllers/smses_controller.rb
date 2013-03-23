class SmsesController < ApplicationController

  def index
    @smses = Sms.scoped.order("created_at desc")
  end

end
