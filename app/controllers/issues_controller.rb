class IssuesController < ApplicationController
  
  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @issue = Issue.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @issues = Issue.search(params[:search])   
    end       
  end
  
  def create
    @issue = Issue.new(dep_params)
    if @issue.save
      flash[:notice] = "Successfully created new issue."
      redirect_to :action => 'edit', :id => @issue.Issue_ID, :search => @issue.Issue_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update(dep_params)  
      flash[:notice] = "Successfully updated the issue."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @issue.Issue_ID, :search => @searchparam    
  end

  def edit     
     @issue = Issue.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Issue.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @issue = Issue.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def dep_params
      params.require(:issue).permit(:Issue_ID, :Name, :Description, :LOP_ID)
    end
end
