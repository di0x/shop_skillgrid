class Seller < User
	devise :database_authenticatable, :validatable, password_length: 8..128
	before_create :set_role
	private
		def set_role 
			self.role = "seller"
		end
end