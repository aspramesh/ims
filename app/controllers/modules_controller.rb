class ModulesController < ApplicationController
   
  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @module = Section.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else
      @modules = Section.search(params[:search])      
    end       
  end
  
  def create
    @module = Section.new(mol_params)
    if @module.save
      flash[:notice] = "Successfully created new module."
      redirect_to :action => 'edit', :id => @module.Module_ID, :search => @module.Module_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @module = Section.find(params[:id])
    if @module.update(mol_params)  
     flash[:notice] = "Successfully updated the module."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @module.Module_ID, :search => @searchparam    
  end

  def edit     
     @module = Section.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Section.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @module = Section.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def mol_params
      params.require(:section).permit(:Module_ID, :Name, :Description, :App_ID, :Owner_ID, :LOP_ID)
    end
end
