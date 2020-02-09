class User < ApplicationRecord
  
  has_secure_password
  
  validates :username, presence: true
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? Bcrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
