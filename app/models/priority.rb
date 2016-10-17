class Priority < ActiveRecord::Base
	self.table_name = "priority"
	self.primary_key = "Priority_ID"

	has_many :issue_priority_id, class_name: 'Issue', foreign_key: 'Issue_Priority_ID'
  	has_many :client_priority_id, class_name: 'Issue', foreign_key: 'Client_Priority_ID'

	validates :Priority_ID, :presence => { :message => "Priority ID is required." }
	validates :Priority_ID, :uniqueness => { :message => "Priority ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }

	 def self.search(query)
 		if query
   	 		self.where("Priority_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 