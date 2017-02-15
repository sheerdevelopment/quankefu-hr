class Absence < ApplicationRecord
  belongs_to :type, class_name: "AbsenceType", foreign_key: :absence_type_id
  belongs_to :status, class_name: "AbsenceStatus", foreign_key: :absence_status_id
  belongs_to :user

  before_save :cal_days

  SECONDS_A_DAY = 60 * 60 * 24
  def cal_days
    range = (self.start.to_date + 1.day)..(self.end.to_date - 1.day)
    weekdays = range.select { |d| (1..5).include?(d.wday) }.size
    delta = ((self.start.seconds_until_end_of_day + self.end.seconds_since_midnight) / SECONDS_A_DAY).round(1)
    self.days = weekdays + delta
  end

  def allow_modify?
    AbsenceStatus::PENDING == absence_status_id
  end
end
