class DesignationsController < ApplicationController

  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @designation = Designation.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @designations = Designation.search(params[:search])   
    end       
  end
  
  def create
    @designation = Designation.new(des_params)
    if @designation.save
      flash[:notice] = "Successfully created new designation."
      redirect_to :action => 'edit', :id => @designation.Designation_ID, :search => @designation.Designation_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @designation = Designation.find(params[:id])
    if @designation.update(des_params) 
     flash[:notice] = "Successfully updated the designation."
    else 
      flash[:notice] = ""
    end  
     render :action => 'edit', :id => @designation.Designation_ID, :search => @searchparam    
  end

  def edit     
     @designation = Designation.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Designation.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @designation = Designation.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def des_params
      params.require(:designation).permit(:Designation_ID, :Name, :Description, :LOP_ID)
    end
end
