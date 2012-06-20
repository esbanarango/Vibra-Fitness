class DiscountsController < ApplicationController

  respond_to :html, :json, :js

  layout 'settings_layout'

  # GET /discounts
  # GET /discounts.json
  def index
    @discounts = Discount.all
    respond_with(@discounts)
  end

  # GET /discounts/1
  # GET /discounts/1.json
  def show
    @discount = Discount.find(params[:id])
    respond_with(@discount)
  end

  # GET /discounts/new
  # GET /discounts/new.json
  def new
    @discount = Discount.new
    respond_with(@discount)
  end

  # GET /discounts/1/edit
  def edit
    @discount = Discount.find(params[:id])
  end

  # POST /discounts
  # POST /discounts.json
  def create
    @discount = Discount.new(params[:discount])
    flash[:success] = "Descuento creado exitosamente" if @discount.save
    respond_with(@discount)
  end

  # PUT /discounts/1
  # PUT /discounts/1.json
  def update
    # if the multiple select list is empty,
    # make sure the seat_ids array exists
    params[:discount][:seat_ids] ||= []
    @discount = Discount.find(params[:id])
    flash[:success] = "Plan editado exitosamente" if @discount.update_attributes(params[:discount])
    respond_with(@discount)
  end

  # DELETE /discounts/1
  # DELETE /discounts/1.json
  def destroy
    @discount = Discount.find(params[:id])
    @discount.destroy

    respond_to do |format|
      format.html { redirect_to discounts_url }
      format.json { head :no_content }
    end
  end
end
