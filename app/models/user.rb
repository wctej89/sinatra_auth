require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  
  validates :name, :password_hash, :email, :presence => true
  validates :email, :uniqueness => true
  # validates_length_of :password, :minimum => 6
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end