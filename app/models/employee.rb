class Employee < ActiveRecord::Base
	self.table_name = "employee"
	self.primary_key = "Emp_ID"

	belongs_to :department, foreign_key: :Department_ID 
	belongs_to :designation, foreign_key: :Designation_ID
	belongs_to :employee, foreign_key: :Manager_ID
	belongs_to :company, foreign_key: :Company_ID

	has_many :projects
	has_many :requestTypes
	has_many :applications
	has_many :modules
	has_many :programs
	has_many :issues
	has_many :timetrackers
	has_many :notetypes

	attr_accessor :password
	#attr_accessible :emp_id, :company_id, :title, :first_name, :middle_name, :last_name, :gender, :dob, :doj, :terminated_ind, :department_id, :designation_id, :manager_id, :address1, :address2, :suburb, :city, :postal_code, :country, :mobile, :phone, :fax, :email, :lop_id
	
	validates :Emp_ID, :presence => { :message => "Employee ID is required." }
	validates :Emp_ID, :uniqueness => { :message => "Employee ID is already taken." }
	validates :Company_ID, :presence => { :message => "Company is required." }
	validates :First_Name, :presence => { :message => "Given Name is required." }
	validates :Gender, :presence => { :message => "Gender is required." }
	validates :Terminated_IND, :presence => { :message => "Terminated Indicator is required." }
	validates :Department_ID, :presence => { :message => "Department is required." }
	validates :Designation_ID, :presence => { :message => "Designation is required." }
	validates :Manager_ID, :presence => { :message => "Manager is required." }
	validates :password, :presence => { :message => "Password is required." }, :on => :create
	validates :Email, :presence => { :message => "Email Address is required." }
	validates :LOP_ID, :presence => { :message => "LOP ID is required." }
	

 	before_save :encrypt_password

	#scope :authenticate, lambda { |emp_id, password| where('emp_id = ? and password = ?', emp_id, password) }
	def self.authenticate(emp_id, password)
	    employee = find_by(:Emp_ID => emp_id)
	    if employee && employee.Password_Hash == BCrypt::Engine.hash_secret(password, employee.Password_Salt)
	      employee
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
		 	self.where("Emp_ID like ?","%#{query}%")
		else
			self.all
		end 
	end


end




 