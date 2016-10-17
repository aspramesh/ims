class CompaniesController < ApplicationController
 
 before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @company = Company.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @companies = Company.search(params[:search])   
    end       
  end
  
  def create
    @company = Company.new(comp_params)
    if @company.save
      flash[:notice] = "Successfully created new company."
      redirect_to :action => 'edit', :id => @company.Company_ID, :search => @company.Company_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(comp_params)  
      flash[:notice] = "Successfully updated the company."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @company.Company_ID, :search => @searchparam    
  end

  def edit     
     @company = Company.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Company.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @company = Company.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def comp_params
      params.require(:company).permit(:Company_ID, :Name, :Description, :ABN_Number, :Address1, :Address2, :Suburb, :City, :Postal_Code, :Country, :Mobile, :Phone, :Fax, :Email, :LOP_ID)
    end
end