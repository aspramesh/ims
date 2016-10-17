class PrioritiesController < ApplicationController
  
  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @priority = Priority.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @priorities = Priority.search(params[:search])   
    end       
  end
  
  def create
    @priority = Priority.new(dep_params)
    if @priority.save
      flash[:notice] = "Successfully created new priority."
      redirect_to :action => 'edit', :id => @priority.Priority_ID, :search => @priority.Priority_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @priority = Priority.find(params[:id])
    if @priority.update(dep_params)  
      flash[:notice] = "Successfully updated the priority."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @priority.Priority_ID, :search => @searchparam    
  end

  def edit     
     @priority = Priority.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Priority.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @priority = Priority.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def dep_params
      params.require(:priority).permit(:Priority_ID, :Name, :Description, :LOP_ID)
    end
end
