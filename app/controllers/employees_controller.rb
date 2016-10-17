class EmployeesController < ApplicationController

  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @employee = Employee.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @employees = Employee.search(params[:search])   
    end       
  end
  
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = "Successfully created new employee."
      redirect_to :action => 'edit', :id => @employee.Emp_ID, :search => @employee.Emp_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)  
      flash[:notice] = "Successfully updated the employee."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @employee.Emp_ID, :search => @searchparam    
  end

  def edit     
     @employee = Employee.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Employee.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @employee = Employee.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def employee_params
      params.require(:employee).permit(:Emp_ID, :password, :Company_ID, :Title, :First_Name, :Middle_Name, :Last_Name, :Gender, :DOB, :DOJ, :Terminated_IND, :Department_ID, :Designation_ID, :Manager_ID, :Address1, :Address2, :Suburb, :City, :Postal_Code, :Country, :Mobile, :Phone, :Fax, :Email, :LOP_ID)
    end

end
