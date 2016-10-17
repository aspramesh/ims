class Designation < ActiveRecord::Base
	self.table_name = "designation"
	self.primary_key = "Designation_ID"

	has_many :employees
	
	validates :Designation_ID, :presence => { :message => "Designation ID is required." }
	validates :Designation_ID, :uniqueness => { :message => "Designation ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }
	
	 def self.search(query)
 		if query
   	 		self.where("Designation_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 