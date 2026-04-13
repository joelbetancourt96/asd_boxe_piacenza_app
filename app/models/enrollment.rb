class Enrollment < ApplicationRecord
  enum :status, { attivo: "attivo", scaduto: "scaduto" }

  belongs_to :profile
  belongs_to :course

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return unless start_date && end_date

    if end_date <= start_date
      errors.add(:end_date, "must be after start date")
    end
  end
end
