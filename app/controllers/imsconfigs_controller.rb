class ImsconfigsController < ApplicationController
 
  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @imsconfig = Imsconfig.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @imsconfigs = Imsconfig.search(params[:search])   
    end       
  end
  
  def create
    @imsconfig = Imsconfig.new(ims_params)
    if @imsconfig.save
      flash[:notice] = "Successfully created new IMS configuration."
      redirect_to :action => 'edit', :id => @imsconfig.IMSConfig_ID, :search => @imsconfig.IMSConfig_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @imsconfig = Imsconfig.find(params[:id])
    if @imsconfig.update(ims_params)  
      flash[:notice] = "Successfully updated the IMS configuration."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @imsconfig.IMSConfig_ID, :search => @searchparam    
  end

  def edit     
     @imsconfig = Imsconfig.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Imsconfig.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @imsconfig = Imsconfig.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def ims_params
      params.require(:imsconfig).permit(:IMSConfig_ID, :Name, :Description, :Value_Integer, :Value_Decimal, :Value_Date, :Value_Datetime, :Value_Time, :Value_String, :LOP_ID)
    end
end