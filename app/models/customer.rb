class Customer < ActiveRecord::Base

	self.table_name = "customer"	
	self.primary_keys = :Client_ID, :Branch

	has_many :issues
	
	attr_accessor :password

	validates :Client_ID, :presence => { :message => "Client ID is required." }
	validates :Branch, :presence => { :message => "Branch is required." }
	validates :Client_ID, uniqueness: { scope: :Branch, :message => "Client ID and Branch is already taken." }
	validates :Company_Name, :presence => { :message => "Company Name is required." }	
	validates :First_Name, :presence => { :message => "Given Name is required." }
	validates :Product, :presence => { :message => "Product is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }
	validates :password, :presence => { :message => "Password is required." }, :on => :create
	
	before_save :encrypt_password

	def self.authenticate(client_id, branch, password)
	    customer = find_by(:Client_ID => client_id, :Branch => branch)
	    if customer && customer.Password_Hash == BCrypt::Engine.hash_secret(password, customer.Password_Salt)
	      customer
	    else
	      nil
	    end
	end 

	def encrypt_password
		if password.present?
		  self.Password_Salt = BCrypt::Engine.generate_salt
		  self.Password_Hash = BCrypt::Engine.hash_secret(password, self.Password_Salt)
		end
	end


	def self.search(query)
 		if query
   	 		self.where("Client_ID like ?","%#{query}%")
   		else
   			self.all
   		end 
  	end

end 