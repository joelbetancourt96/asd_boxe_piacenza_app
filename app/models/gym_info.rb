class GymInfo < ApplicationRecord
  validates :gym_name, presence: true
  validates :gym_address, presence: true
  validates :city, presence: true
  validates :info_email, presence: true
  validates :vat_number, presence: true
end
