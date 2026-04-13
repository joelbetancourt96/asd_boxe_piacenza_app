class AthleteDetail < ApplicationRecord
  belongs_to :profile

  validates :fpi_card_id, presence: true, uniqueness: true
  validates :wins, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :draws, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :losses, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :weight, numericality: { greater_than: 0 }
  validates :category, presence: true
end
