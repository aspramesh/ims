class RequesttypesController < ApplicationController

  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @requesttype = Requesttype.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @requesttypes = Requesttype.search(params[:search])   
    end       
  end
  
  def create
    @requesttype = Requesttype.new(req_params)
    if @requesttype.save
      flash[:notice] = "Successfully created new request type."
      redirect_to :action => 'edit', :id => @requesttype.RequestType_ID, :search => @requesttype.RequestType_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @requesttype = Requesttype.find(params[:id])
    if @requesttype.update(req_params)  
      flash[:notice] = "Successfully updated the request type."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @requesttype.RequestType_ID, :search => @searchparam    
  end

  def edit     
     @requesttype = Requesttype.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Requesttype.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @requesttype = Requesttype.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def req_params
      params.require(:requesttype).permit(:RequestType_ID, :Name, :Description, :Project_ID, :Owner_ID, :LOP_ID)
    end
end
