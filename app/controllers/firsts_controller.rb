class FirstsController < ApplicationController
  # GET /firsts
  # GET /firsts.json
  def index
    @firsts = Code.find_by_sql("SELECT codes.user_id, min(codes.created_at), max(codes.created_at) FROM codes Group BY codes.user_id ORDER BY codes.user_id")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @firsts }
    end
  end


end
