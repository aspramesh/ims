class Requesttype < ActiveRecord::Base
	self.table_name = "requesttype"
	self.primary_key = "RequestType_ID"

	belongs_to :employee, foreign_key: :Owner_ID
	belongs_to :project, foreign_key: :Project_ID

	has_many :issues
	
	validates :RequestType_ID, :presence => { :message => "RequestType ID is required." }
	validates :RequestType_ID, :uniqueness => { :message => "RequestType ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :Project_ID, :presence => { :message => "Project is required." }
	validates :Owner_ID, :presence => { :message => "Owner is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }
	
	 def self.search(query)
 		if query
   	 		self.where("RequestType_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 