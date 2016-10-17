class Company < ActiveRecord::Base
	self.table_name = "company"
	self.primary_key = "Company_ID"

	has_many :employees
	
	validates :Company_ID, :presence => { :message => "Company ID is required." }
	validates :Company_ID, :uniqueness => { :message => "Company ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }	
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }

	 def self.search(query)
 		if query
   	 		self.where("Company_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 