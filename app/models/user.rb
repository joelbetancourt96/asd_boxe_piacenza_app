class User < ApplicationRecord
  has_secure_password
  has_one :profile

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true
end
