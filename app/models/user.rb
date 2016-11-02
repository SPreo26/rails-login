class User < ActiveRecord::Base
  has_secure_password
  before_create :generate_token

  def generate_token
    self.auth_token = SecureRandom.base64(20)
  end

  
end
