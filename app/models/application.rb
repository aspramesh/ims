class Application < ActiveRecord::Base
	self.table_name = "app"
	self.primary_key = "App_ID"

	belongs_to :employee, foreign_key: :Owner_ID
	belongs_to :project, foreign_key: :Project_ID

	has_many :issues
	has_many :applicationversions
	has_many :modules

	validates :App_ID, :presence => { :message => "Application ID is required." }
	validates :App_ID, :uniqueness => { :message => "Application ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :Project_ID, :presence => { :message => "Project is required." }
	validates :Owner_ID, :presence => { :message => "Owner is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }
	
	 def self.search(query)
 		if query
   	 		self.where("App_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 