class Issuesource < ActiveRecord::Base
	self.table_name = "issuesource"
	self.primary_key = "IssueSource_ID"

	has_many :issues
	
	validates :IssueSource_ID, :presence => { :message => "Issue Source ID is required." }
	validates :IssueSource_ID, :uniqueness => { :message => "Issue Source ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }

	 def self.search(query)
 		if query
   	 		self.where("IssueSource_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 