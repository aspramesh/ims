class ProgramsController < ApplicationController
  
  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @program = Program.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @programs = Program.search(params[:search])   
    end       
  end
  
  def create
    @program = Program.new(pro_params)
    if @program.save
      flash[:notice] = "Successfully created new program."
      redirect_to :action => 'edit', :id => @program.Program_ID, :search => @program.Program_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @program = Program.find(params[:id])
    if @program.update(pro_params)  
      flash[:notice] = "Successfully updated the program."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @program.Program_ID, :search => @searchparam    
  end

  def edit     
     @program = Program.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Program.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @program = Program.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def pro_params
      params.require(:program).permit(:Program_ID, :Name, :Description, :Module_ID, :Owner_ID, :LOP_ID)
    end
end
