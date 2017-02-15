class Absence < ApplicationRecord
  belongs_to :type, class_name: "AbsenceType", foreign_key: :absence_type_id
  belongs_to :status, class_name: "AbsenceStatus", foreign_key: :absence_status_id
  belongs_to :user

  before_save :cal_days

  SECONDS_A_DAY = 60 * 60 * 24
  WEEKDAYS = (1..5)
  def cal_days
    range = (self.start.to_date + 1.day)..(self.end.to_date - 1.day)
    weekdays = range.select { |date| week_day?(date) }.size
    seconds = 0.0
    seconds += self.start.seconds_until_end_of_day if week_day?(self.start)
    seconds += self.end.seconds_since_midnight if week_day?(self.end)
    self.days = weekdays + (seconds / SECONDS_A_DAY).round(1)
  end

  def allow_modify?
    AbsenceStatus::PENDING == absence_status_id
  end

  private

  def week_day?(date)
    WEEKDAYS.include?(date.wday)
  end
end
