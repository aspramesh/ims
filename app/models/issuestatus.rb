class Issuestatus < ActiveRecord::Base
	self.table_name = "issuestatus"
	self.primary_key = "IssueStatus_ID"

	has_many :issues
	
	validates :IssueStatus_ID, :presence => { :message => "Issue Status ID is required." }
	validates :IssueStatus_ID, :uniqueness => { :message => "Issue Status ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }

	 def self.search(query)
 		if query
   	 		self.where("IssueStatus_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 