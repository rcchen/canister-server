include BCrypt

class User < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :photos
  has_many :tokens
  validates :email, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
