class DepartmentsController < ApplicationController
  
  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @department = Department.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @departments = Department.search(params[:search])   
    end       
  end
  
  def create
    @department = Department.new(dep_params)
    if @department.save
      flash[:notice] = "Successfully created new department."
      redirect_to :action => 'edit', :id => @department.Department_ID, :search => @department.Department_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(dep_params)  
      flash[:notice] = "Successfully updated the department."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @department.Department_ID, :search => @searchparam    
  end

  def edit     
     @department = Department.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Department.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @department = Department.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def dep_params
      params.require(:department).permit(:Department_ID, :Name, :Description, :LOP_ID)
    end
end
