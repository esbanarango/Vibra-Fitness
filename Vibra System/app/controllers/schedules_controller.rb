class SchedulesController < ApplicationController

  respond_to :html, :json, :js

  # GET /schedules
  # GET /schedules.json
  # /settings/seats/:seat_id/schedules(.:format) 
  def settings_index
    @seat = Seat.find(params[:seat_id])
    @schedules = @seat.schedules
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    render :layout => "settings_layout"
  end

  # GET /schedules
  # GET /schedules.json
  def index
    @seat = Seat.find(params[:seat_id])
    @schedules = @seat.schedules
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end


  # GET /schedules/1
  # GET /schedules/1.json
  # BOOKING
  def show
    @date = params[:id]
    @seat = Seat.find(params[:seat_id])
    @schedules = @seat.schedules.where("date = ?",@date )
    @clients = Client.search(params[:search]).page(params[:page]).per(10)
  end

  # GET /schedules/new
  # GET /schedules/new.json
  def new
    @schedule = Schedule.new
    @conf_schedule = ConfSchedule.new
    @seat = Seat.find(params[:seat_id])
    @schedules = @seat.schedules.where("date = ?",params[:date])
    @dateSchedule = params[:date] # Necesary to initialize the times
    render :layout => "settings_layout"
  end

  # GET /schedules/1/edit
  def edit
    @schedule = Schedule.find(params[:id])
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @save = false
    @schedule = Schedule.new(params[:schedule])
    # First check if there is a schedule that intersects
    if !@schedule.same_hours? and @schedule.save
      @save = true
    end 
  end

  # POST /schedules_fast
  # POST /schedules_fast.json
  def create_fast
    @conf_schedule = ConfSchedule.new(params[:conf_schedule])
    @conf_schedule.generate
    @seat = Seat.find(params[:conf_schedule][:seat_id])
    @schedules = @seat.schedules.where("date = ?",params[:conf_schedule][:date])
  end


  # PUT /schedules/1
  # PUT /schedules/1.json
  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @scheduleId = params[:id]
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
  end
end
