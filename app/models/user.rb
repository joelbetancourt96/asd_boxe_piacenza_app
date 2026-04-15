class User < ApplicationRecord
  has_secure_password
  has_one :profile

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true # , length: { minimum: 6 }, if: :password_digest_changed? Controlla il progetto vendelo per capire se è necessario aggiungere questa validazione
end
