class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 6..128
  has_many :articles
  before_create :set_role
  private
	def set_role 
		self.role = "user"
	end
end