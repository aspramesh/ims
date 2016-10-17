class Imsconfig < ActiveRecord::Base
	self.table_name = "imsconfig"
	self.primary_key = "IMSConfig_ID"
	
	validates :IMSConfig_ID, :presence => { :message => "IMS Config ID is required." }
	validates :IMSConfig_ID, :uniqueness => { :message => "IMS Config ID is already taken." }
	validates :Name, :presence => { :message => "Name is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }

	 def self.search(query)
 		if query
   	 		self.where("IMSConfig_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  end


end




 