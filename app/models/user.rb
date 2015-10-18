class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true
  validates :email, presence: true, :uniqueness => { case_sensitive: false }, format: { with: EMAIL_REGEX }
  has_secure_password
end
