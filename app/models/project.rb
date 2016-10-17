class Project < ActiveRecord::Base
	self.table_name = "project"
	self.primary_key = "Project_ID"

	belongs_to :employee, foreign_key: :Owner_ID
	
	has_many :issues
	has_many :applications
	has_many :requesttypes

	validates :Project_ID, :presence => { :message => "Project ID is required." }
	validates :Project_ID, :uniqueness => { :message => "Project ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :Owner_ID, :presence => { :message => "Owner is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }
	
	 def self.search(query)
 		if query
   	 		self.where("Project_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 