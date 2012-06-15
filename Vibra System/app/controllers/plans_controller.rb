class PlansController < ApplicationController

  respond_to :html, :json, :js

  layout 'settings_layout'


  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
    respond_with(@plans)
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    @plan = Plan.find(params[:id])
    respond_with(@plan)
  end

  # GET /plans/new
  # GET /plans/new.json
  def new
    @plan = Plan.new
    respond_with(@plan)
  end

  # GET /plans/1/edit
  def edit
    @plan = Plan.find(params[:id])
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(params[:plan])
    flash[:success] = "Plan creado exitosamente" if @plan.save
    respond_with(@plan)
  end

  # PUT /plans/1
  # PUT /plans/1.json
  def update
    @plan = Plan.find(params[:id])
    flash[:success] = "Plan editado exitosamente" if @plan.update_attributes(params[:plan])
    respond_with(@plan)
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to plans_url }
      format.json { head :no_content }
    end
  end
end
