class Profile < ApplicationRecord
  enum :profile_type, { admin: 0, allenatore: 1, atleta_agonista: 2, amatore: 3 }
  has_one_attached :profile_image

  belongs_to :user
  has_one :athlete_detail
  has_many :enrollments
  has_many :courses, through: :enrollments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_type, presence: true
end
