class ClientsController < ApplicationController

  respond_to :html, :json

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.order("first_name").page(params[:page]).per(10)
    respond_with(@clients)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])
    respond_with(@client)
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new
    respond_with(@client)
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])
    @client.generate_password
    flash[:success] = "Cliente creado exitosamente" if @client.save
    respond_with(@client)
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])
    flash[:success] = "Cliente editado exitosamente" if @client.update_attributes(params[:client])
    respond_with(@client)
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end
end
