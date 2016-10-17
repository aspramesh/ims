class IssuetagsController < ApplicationController
  
  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @issuetag = Issuetag.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @issuetags = Issuetag.search(params[:search])   
    end       
  end
  
  def create
    @issuetag = Issuetag.new(dep_params)
    if @issuetag.save
      flash[:notice] = "Successfully created new issue tag."
      redirect_to :action => 'edit', :id => @issuetag.IssueTag_ID, :search => @issuetag.IssueTag_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @issuetag = Issuetag.find(params[:id])
    if @issuetag.update(dep_params)
      flash[:notice] = "Successfully updated the issue tag."
    else 
      flash[:notice] = ""
    end   
     render :action => 'edit', :id => @issuetag.IssueTag_ID, :search => @searchparam    
  end

  def edit     
     @issuetag = Issuetag.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Issuetag.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @issuetag = Issuetag.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def dep_params
      params.require(:issuetag).permit(:IssueTag_ID, :Name, :Description, :LOP_ID)
    end
end
