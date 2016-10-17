class IssuelabelsController < ApplicationController
 
 before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @issuelabel = Issuelabel.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @issuelabels = Issuelabel.search(params[:search])   
    end       
  end
  
  def create
    @issuelabel = Issuelabel.new(dep_params)
    if @issuelabel.save
      flash[:notice] = "Successfully created new issue label."
      redirect_to :action => 'edit', :id => @issuelabel.IssueLabel_ID, :search => @issuelabel.IssueLabel_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @issuelabel = Issuelabel.find(params[:id])
    if @issuelabel.update(dep_params)  
      flash[:notice] = "Successfully updated the issue label."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @issuelabel.IssueLabel_ID, :search => @searchparam    
  end

  def edit     
     @issuelabel = Issuelabel.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Issuelabel.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @issuelabel = Issuelabel.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def dep_params
      params.require(:issuelabel).permit(:IssueLabel_ID, :Name, :Description, :LOP_ID)
    end
end
