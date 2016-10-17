class Program < ActiveRecord::Base
	self.table_name = "program"
	self.primary_key = "Program_ID"

	belongs_to :employee, foreign_key: :Owner_ID
	belongs_to :section, foreign_key: :Module_ID

	has_many :issues
	
	validates :Program_ID, :presence => { :message => "Program ID is required." }
	validates :Program_ID, :uniqueness => { :message => "Program ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :Module_ID, :presence => { :message => "Module is required." }
	validates :Owner_ID, :presence => { :message => "Owner is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }
	
	 def self.search(query)
 		if query
   	 		self.where("Program_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 