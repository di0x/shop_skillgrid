class Admin < User
	devise :database_authenticatable, :validatable, password_length: 10..128
	before_create :set_role
	private
		def set_role 
			self.role = "admin"
		end
end