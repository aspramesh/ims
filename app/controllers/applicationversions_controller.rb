class ApplicationversionsController < ApplicationController

  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @applicationversion = Applicationversion.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @applicationversions = Applicationversion.search(params[:search])   
    end       
  end
  
  def create
    @applicationversion = Applicationversion.new(appver_params)
    if @applicationversion.save
      flash[:notice] = "Successfully created new application version."
      redirect_to :action => 'edit', :id => @applicationversion.AppVersion_ID, :search => @applicationversion.AppVersion_ID
     else 
      flash[:notice] = ""
      render :action => 'new'      
    end   
  end

  def update
    @applicationversion = Applicationversion.find(params[:id])
    if @applicationversion.update(appver_params)
      flash[:notice] = "Successfully updated the application version."
    else 
      flash[:notice] = ""
    end   
     render :action => 'edit', :id => @applicationversion.AppVersion_ID, :search => @searchparam    
  end

  def edit     
     @applicationversion = Applicationversion.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Applicationversion.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @applicationversion = Applicationversion.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def appver_params
      params.require(:applicationversion).permit(:AppVersion_ID, :Name, :Description, :App_ID, :LOP_ID)
    end
end
