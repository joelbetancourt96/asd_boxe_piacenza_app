class User < ApplicationRecord
  has_secure_password
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  normalizes :email, with: ->(email) { email.strip.downcase }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, confirmation: true, allow_nil: true
  validates :password_confirmation, presence: true, if: -> { password.present? }
end
