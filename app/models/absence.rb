class Absence < ApplicationRecord
  belongs_to :type, class_name: "AbsenceType", foreign_key: :absence_type_id
  belongs_to :status, class_name: "AbsenceStatus", foreign_key: :absence_status_id
  belongs_to :user

  before_save :cal_days

  SECONDS_A_DAY = 60 * 60 * 24
  def cal_days
    self.days = ((self.end - self.start) / SECONDS_A_DAY).round(2)
  end

  def allow_modify?
    AbsenceStatus::PENDING == absence_status_id
  end
end
