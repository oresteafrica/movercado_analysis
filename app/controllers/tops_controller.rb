class TopsController < ApplicationController
  # GET /tops
  # GET /tops.json
  def index
#    @tops = Code.all
    @tops = Code.find_by_sql("SELECT DISTINCT nweek, uid, cc, rr FROM ( SELECT DISTINCT nweek, uid, cc, row_number() OVER (ORDER BY cc DESC) as rr FROM ( SELECT DISTINCT ON (nweek, uid) nweek, uid, cc FROM ( SELECT extract(week from codes.created_at) AS nweek, codes.user_id as uid, COUNT(codes.user_id) OVER (PARTITION BY codes.user_id) as cc FROM codes ) as sele1 ) as sele2 ORDER BY nweek, rr ) as sele3 WHERE rr < 11 ORDER BY rr")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tops }
    end
  end


end
