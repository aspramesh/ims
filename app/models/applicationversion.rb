class Applicationversion < ActiveRecord::Base
	
	self.table_name = "appversion"
	self.primary_key = "AppVersion_ID"

	belongs_to :application, foreign_key: :App_ID

	has_many :issues
	
	validates :AppVersion_ID, :presence => { :message => "App Version ID is required." }
	validates :AppVersion_ID, :uniqueness => { :message => "App Version ID is already taken." }
	validates :Name, :presence => { :message => "Version is required." }
	validates :App_ID, :presence => { :message => "Application is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }
	
	 def self.search(query)
 		if query
   	 		self.where("AppVersion_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
 	 end
end