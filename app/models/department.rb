class Department < ActiveRecord::Base
	self.table_name = "department"
	self.primary_key = "Department_ID"

	has_many :employees
	
	validates :Department_ID, :presence => { :message => "Department ID is required." }
	validates :Department_ID, :uniqueness => { :message => "Department ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }

	 def self.search(query)
 		if query
   	 		self.where("Department_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 