class EmployeesController < ApplicationController
  helper_method :sort_column, :sort_direction

  respond_to :html, :json, :js

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(10)
    respond_with(@employees)
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
    respond_with(@employee)
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new
    respond_with(@employee)
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])
    flash[:success] = "Empleado creado exitosamente" if @employee.save
    respond_with(@employee)
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])
    flash[:success] = "Empleado editado exitosamente" if @employee.update_attributes(params[:employee])
    respond_with(@employee)
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  private
  
    def sort_column
      Employee.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
