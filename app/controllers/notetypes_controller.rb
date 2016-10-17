class NotetypesController < ApplicationController
  
  before_filter :check_for_signed_in

  def check_for_signed_in    
    if session[:signed_in] == true
    else
      redirect_to :controller => 'pages', :action => 'login'  
    end 
  end

  def new
    flash[:notice] = ""
    @notetype = Notetype.new
  end

  def index
    flash[:notice] = ""
    if params[:commit] == 'New'
      redirect_to :action => 'new'
    else 
      @notetypes = Notetype.search(params[:search])   
    end       
  end
  
  def create
    @notetype = Notetype.new(dep_params)
    if @notetype.save
      flash[:notice] = "Successfully created new note type."
      redirect_to :action => 'edit', :id => @notetype.NoteType_ID, :search => @notetype.NoteType_ID
    else 
      flash[:notice] = ""
      render :action => 'new'      
    end    
  end

  def update
    @notetype = Notetype.find(params[:id])
    if @notetype.update(dep_params)  
      flash[:notice] = "Successfully updated the note type."
    else 
      flash[:notice] = ""
    end 
     render :action => 'edit', :id => @notetype.NoteType_ID, :search => @searchparam    
  end

  def edit     
     @notetype = Notetype.find(params[:id])  
     @searchparam = params[:search]  
  end

  def destroy   
  end

  def delete
    Notetype.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
     @notetype = Notetype.find(params[:id])
     @searchparam = params[:search]
  end

  private
    def dep_params
      params.require(:notetype).permit(:NoteType_ID, :Name, :Description, :LOP_ID)
    end
end
