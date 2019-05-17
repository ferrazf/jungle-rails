class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, :password_confirmation, :first_name, :last_name, :email, presence: true
  validates :password, length: { minimum: 6 }
end