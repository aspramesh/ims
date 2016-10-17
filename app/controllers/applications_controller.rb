class ApplicationsController < ApplicationController
  
  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @application = Application.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @applications = Application.search(params[:search])   
    end       
  end
  
  def create
    @application = Application.new(app_params)
    if @application.save      
      flash[:notice] = "Successfully created new application."
      redirect_to :action => 'edit', :id => @application.App_ID, :search => @application.App_ID      
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @application = Application.find(params[:id])
    if @application.update(app_params)  
      flash[:notice] = "Successfully updated the application."
    else 
      flash[:notice] = ""
    end 
    render :action => 'edit', :id => @application.App_ID, :search => @searchparam    
  end

  def edit    
    @application = Application.find(params[:id])  
    @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Application.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @application = Application.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def app_params
      params.require(:application).permit(:App_ID, :Name, :Description, :Project_ID, :Owner_ID, :LOP_ID)
    end
end
