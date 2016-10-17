class Issuelabel < ActiveRecord::Base
	self.table_name = "issuelabel"
	self.primary_key = "IssueLabel_ID"

	has_many :issues
	
	validates :IssueLabel_ID, :presence => { :message => "Issue Label ID is required." }
	validates :IssueLabel_ID, :uniqueness => { :message => "Issue Label ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }

	 def self.search(query)
 		if query
   	 		self.where("IssueLabel_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 