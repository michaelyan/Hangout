class HangoutEventsController < ApplicationController
  before_action :set_hangout_event, only: [:show, :edit, :update, :destroy, :invite]

  # GET /hangout_events
  # GET /hangout_events.json
  def index
    @hangout_events = HangoutEvent.all
  end

  # GET /hangout_events/1
  # GET /hangout_events/1.json
  def show
  end

  # GET /hangout_events/new
  def new
    @hangout_event = HangoutEvent.new
  end

  # GET /hangout_events/1/edit
  def edit
  end

  # POST /hangout_events
  # POST /hangout_events.json
  def create
    @hangout_event = HangoutEvent.new(hangout_event_params)

    respond_to do |format|
      if @hangout_event.save
        format.html { redirect_to @hangout_event, notice: 'Hangout event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hangout_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @hangout_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hangout_events/1
  # PATCH/PUT /hangout_events/1.json
  def update
    respond_to do |format|
      if @hangout_event.update(hangout_event_params)
        format.html { redirect_to @hangout_event, notice: 'Hangout event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hangout_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hangout_events/1
  # DELETE /hangout_events/1.json
  def destroy
    @hangout_event.destroy
    respond_to do |format|
      format.html { redirect_to hangout_events_url }
      format.json { head :no_content }
    end
  end

  def invite
    # 1. get the hangout_id
    # 2. get all the users in the database that aren't part of the event
    # 3. Put this in model
    # @attendees = HangoutEvent.find(params[:id]).attendees
    @attendees = @hangout_event.attendees
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hangout_event
      @hangout_event = HangoutEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hangout_event_params
      params.require(:hangout_event).permit(:name, :date, :start_time, :end_time)
    end
end
