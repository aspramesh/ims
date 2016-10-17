class CustomersController < ApplicationController
 
  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @customer = Customer.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @customers = Customer.search(params[:search])   
    end       
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "Successfully created new customer."
      redirect_to :action => 'edit', :id => @customer.Client_ID, :branch => @customer.Branch, :search => @customer.Client_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update    
    #@customer = Customer.where(Client_ID: customer_params[:Client_ID], Branch: customer_params[:Branch]).first  
    @customer = Customer.find(params[:id])  
    if @customer.update(customer_params)  
     flash[:notice] = "Successfully updated the customer."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @customer.Client_ID, :branch => @customer.Branch, :search => @searchparam    
  end

  def edit     
     @customer = Customer.where(Client_ID: params[:id], Branch: params[:branch]).first   
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    customer = Customer.where(Client_ID: params[:id], Branch: params[:branch]).first 
    customer.destroy
    redirect_to :action => 'index'
  end

  def show
     @customer = Customer.where(Client_ID: params[:id], Branch: params[:branch]).first  
     @searchparam = params[:search]
  end

  private
    def customer_params
      params.require(:customer).permit(:Client_ID, :Branch, :password, :Company_Name, :Title, :First_Name, :Middle_Name, :Last_Name, :Gender, :Address1, :Address2, :Suburb, :City, :Postal_Code, :Country, :Mobile, :Phone, :Fax, :Email, :Product, :Support_Expiry_Date, :LOP_ID)
    end

end