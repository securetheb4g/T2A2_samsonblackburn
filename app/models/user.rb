class User < ApplicationRecord
  rolify :role_cname => 'Roles'
  after_create :assign_default_role
  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         
  def assign_default_role
    self.add_role(:buyer)
  end
end
