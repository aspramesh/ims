class ProjectsController < ApplicationController
  
  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @project = Project.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @projects = Project.search(params[:search])   
    end       
  end
  
  def create
    @project = Project.new(pro_params)
    if @project.save
      flash[:notice] = "Successfully created new project."
      redirect_to :action => 'edit', :id => @project.Project_ID, :search => @project.Project_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(pro_params)  
     flash[:notice] = "Successfully updated the project."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @project.Project_ID, :search => @searchparam    
  end

  def edit     
     @project = Project.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Project.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @project = Project.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def pro_params
      params.require(:project).permit(:Project_ID, :Name, :Description, :Owner_ID, :LOP_ID)
    end
end
