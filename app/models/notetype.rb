class Notetype < ActiveRecord::Base
	self.table_name = "notetype"
	self.primary_key = "NoteType_ID"

	has_many :notes
	
	validates :NoteType_ID, :presence => { :message => "Note Type ID is required." }
	validates :NoteType_ID, :uniqueness => { :message => "Note Type ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }

	 def self.search(query)
 		if query
   	 		self.where("NoteType_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 