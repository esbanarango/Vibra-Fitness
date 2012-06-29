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
    @clients = Client.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(10)
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
  # Reserve Turn
  def update
    @client = Client.find(params[:machine][:client_id])
    @historyPlan = @client.historyPlans.where("state = \'Activo\'").limit(1)[0]
    if @historyPlan and params[:waiting] == "false"
      @historyPlan.num_sessions = @historyPlan.num_sessions - 1 
      @historyPlan.save
    end
    @machine = Machine.find_or_create_by_schedule_id_and_client_id_and_machine_num(:schedule_id => params[:id], :client_id => params[:machine][:client_id], :machine_num => params[:machine][:machine_num])
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def cancel_turn
    @client = Client.find(params[:machine][:client_id])
    @historyPlan = @client.historyPlans.where("state = \'Activo\'").limit(1)[0]

    if @historyPlan and params[:waiting] == "false"
      puts "sisas"
      @historyPlan.num_sessions = @historyPlan.num_sessions + 1 
      @historyPlan.save
    end

    @machine = Machine.where("schedule_id= ? and client_id = ? and machine_num = ?",params[:machine][:schedule_id],params[:machine][:client_id],params[:machine][:machine_num]).limit(1)[0]
    @machine.destroy
  end


  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @scheduleId = params[:id]
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
  end

  private
  
    def sort_column
      Client.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end



end
