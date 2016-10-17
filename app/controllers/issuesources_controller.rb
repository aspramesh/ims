class IssuesourcesController < ApplicationController
  
  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @issuesource = Issuesource.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @issuesources = Issuesource.search(params[:search])   
    end       
  end
  
  def create
    @issuesource = Issuesource.new(dep_params)
    if @issuesource.save
      flash[:notice] = "Successfully created new issue source."
      redirect_to :action => 'edit', :id => @issuesource.IssueSource_ID, :search => @issuesource.IssueSource_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @issuesource = Issuesource.find(params[:id])
    if @issuesource.update(dep_params)  
      flash[:notice] = "Successfully updated the issue source."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @issuesource.IssueSource_ID, :search => @searchparam    
  end

  def edit     
     @issuesource = Issuesource.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Issuesource.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @issuesource = Issuesource.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def dep_params
      params.require(:issuesource).permit(:IssueSource_ID, :Name, :Description, :LOP_ID)
    end
end
