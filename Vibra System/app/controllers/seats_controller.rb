class SeatsController < ApplicationController

  respond_to :html, :json, :js

  # GET /seats
  # GET /seats.json
  def index
    @seats = Seat.all
    respond_with(@seats)
  end

  # GET /seats/1
  # GET /seats/1.json
  def show
    @seat = Seat.find(params[:id])
    respond_with(@seat)
  end

  # GET /seats/new
  # GET /seats/new.json
  def new
    @seat = Seat.new
    respond_with(@seat)
  end

  # GET /seats/1/edit
  def edit
    @seat = Seat.find(params[:id])
  end

  # POST /seats
  # POST /seats.json
  def create
    @seat = Seat.new(params[:seat])
    flash[:success] = "Sede creada exitosamente" if @seat.save
    respond_with(@seat)
  end

  # PUT /seats/1
  # PUT /seats/1.json
  def update
    @seat = Seat.find(params[:id])
    flash[:success] = "Sede editada exitosamente" if @seat.update_attributes(params[:seat])
    respond_with(@seat)
  end

  # DELETE /seats/1
  # DELETE /seats/1.json
  def destroy
    @seat = Seat.find(params[:id])
    @seat.destroy

    respond_to do |format|
      format.html { redirect_to seats_url }
      format.json { head :no_content }
    end
  end
end
