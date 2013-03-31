class IonsController < ApplicationController
  # GET /ions
  # GET /ions.json
  def index
    @ions = Code.find_by_sql("SELECT codes.user_id, COUNT(codes.user_id) AS counter FROM codes GROUP BY codes.user_id ORDER BY user_id")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ions }
    end
  end

end
