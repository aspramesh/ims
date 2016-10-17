class Issuetag < ActiveRecord::Base
	self.table_name = "issuetag"
	self.primary_key = "IssueTag_ID"

	has_many :issues
	
	validates :IssueTag_ID, :presence => { :message => "Issue Tag ID is required." }
	validates :IssueTag_ID, :uniqueness => { :message => "Issue Tag ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }

	 def self.search(query)
 		if query
   	 		self.where("IssueTag_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 