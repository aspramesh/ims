class PagesController < ApplicationController

  def about
  end

  def accessdenied
  end

  def login   
  	if session[:signed_in] == true 
  	 	redirect_to :controller => 'pages', :action => 'home'  
  	end
  end

  def authenticate
    employee = Employee.authenticate(params[:userid], params[:passcode])
    if employee
      session[:signed_in] = true 
      session[:user_id] = employee.Emp_ID
      session[:first_name] = employee.First_Name 
      session[:last_name] = employee.Last_Name
      session[:full_name] = employee.Title + ' ' + employee.First_Name + ' ' + employee.Middle_Name + ' ' + employee.Last_Name
      redirect_to :controller => 'pages', :action => 'home'
    else
      redirect_to :controller => 'pages', :action => 'login'  
      flash[:notice] = "The user id and password you entered don't match."
    end
  end

  def logout    
    session[:signed_in] = false
    session[:user_id] = nil
    session[:first_name] = nil
    session[:last_name] = nil
    session[:full_name] = nil    
  end

end
