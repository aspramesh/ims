class IssuestatusesController < ApplicationController
  
  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @issuestatus = Issuestatus.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @issuestatuses = Issuestatus.search(params[:search])   
    end       
  end
  
  def create
    @issuestatus = Issuestatus.new(dep_params)
    if @issuestatus.save
      flash[:notice] = "Successfully created new issue status."
      redirect_to :action => 'edit', :id => @issuestatus.IssueStatus_ID, :search => @issuestatus.IssueStatus_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @issuestatus = Issuestatus.find(params[:id])
    if @issuestatus.update(dep_params)  
      flash[:notice] = "Successfully updated the issue status."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @issuestatus.IssueStatus_ID, :search => @searchparam    
  end

  def edit     
     @issuestatus = Issuestatus.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Issuestatus.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @issuestatus = Issuestatus.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def dep_params
      params.require(:issuestatus).permit(:IssueStatus_ID, :Name, :Description, :LOP_ID)
    end
end
