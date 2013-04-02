class TestmailsController < ApplicationController
  # GET /testmails
  # GET /testmails.json
  def index
    @testmails = Interaction.find_by_sql("select user_id, count(user_id) as user_interactions, app_id from interactions group by user_id, app_id order by user_interactions desc limit 1")
    
    if @testmails != []
    a = @testmails[0]['user_interactions']
    b = @testmails[0]['user_id']
    c = @testmails[0]['app_id']
    addbody = "There are a maximum of #{a} Movercado interactions for user n. #{b} app n. #{c}"
	else
    addbody = "@testmails is empty"
	end

	UserAlert.test_email(addbody).deliver

  end
end




