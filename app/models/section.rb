class Section < ActiveRecord::Base
	self.table_name = "module"
	self.primary_key = "Module_ID"

	belongs_to :employee, foreign_key: :Owner_ID
	belongs_to :application, foreign_key: :App_ID

	has_many :issues
	has_many :programs

	validates :Module_ID, :presence => { :message => "Module ID is required." }
	validates :Module_ID, :uniqueness => { :message => "Module ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :App_ID, :presence => { :message => "Application is required." }
	validates :Owner_ID, :presence => { :message => "Owner is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }
	
	 def self.search(query)
 		if query
   	 		self.where("Module_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 