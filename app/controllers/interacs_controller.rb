class InteracsController < ApplicationController
  # GET /interacs
  # GET /interacs.json

  def index
    @interacs = Interaction.find_by_sql("select user_id, count(user_id) as user_interactions, app_id from interactions group by user_id, app_id order by user_interactions desc limit 1")

    respond_to do |format|
      format.json { render json: @interacs }
    end

  end




end
