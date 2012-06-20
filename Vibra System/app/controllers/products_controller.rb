class ProductsController < ApplicationController

  respond_to :html, :json, :js

  layout 'settings_layout'

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    respond_with(@products)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    respond_with(@product)
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    respond_with(@product)
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    flash[:success] = "Producto creado exitosamente" if @product.save
    respond_with(@product)
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    flash[:success] = "Producto editado exitosamente" if @product.update_attributes(params[:product])
    respond_with(@product)
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
