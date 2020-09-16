class User < ActiveRecord::Base

  has_secure_password
  validates :first_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password_digest, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

end
