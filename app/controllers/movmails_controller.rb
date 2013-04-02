class MovmailsController < ApplicationController


# UserAlert.alert_email().deliver


  # GET /movmails
  # GET /movmails.json
  def index
    @movmails = Movmail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movmails }
    end
  end

  # GET /movmails/1
  # GET /movmails/1.json
  def show
    @movmail = Movmail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movmail }
    end
  end

  # GET /movmails/new
  # GET /movmails/new.json
  def new
    @movmail = Movmail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movmail }
    end
  end

  # GET /movmails/1/edit
  def edit
    @movmail = Movmail.find(params[:id])
  end

  # POST /movmails
  # POST /movmails.json
  def create
    @movmail = Movmail.new(params[:movmail])

    respond_to do |format|
      if @movmail.save
        format.html { redirect_to @movmail, notice: 'Movmail was successfully created.' }
        format.json { render json: @movmail, status: :created, location: @movmail }
      else
        format.html { render action: "new" }
        format.json { render json: @movmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movmails/1
  # PUT /movmails/1.json
  def update
    @movmail = Movmail.find(params[:id])

    respond_to do |format|
      if @movmail.update_attributes(params[:movmail])
        format.html { redirect_to @movmail, notice: 'Movmail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movmails/1
  # DELETE /movmails/1.json
  def destroy
    @movmail = Movmail.find(params[:id])
    @movmail.destroy

    respond_to do |format|
      format.html { redirect_to movmails_url }
      format.json { head :no_content }
    end
  end
end
