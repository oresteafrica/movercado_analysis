class MorethansController < ApplicationController
  # GET /morethans
  # GET /morethans.json
  
  def index
    @morethans = Interaction.find_by_sql("select user_id, count(user_id) as user_interactions, app_id from interactions group by user_id, app_id having app_id = 1 order by user_interactions desc limit 1")
	
	if @morethans != []
		if @morethans[0]['user_interactions'].to_i > 1000
			UserAlert.alert_email().deliver
		end
	end

  end

 
end
