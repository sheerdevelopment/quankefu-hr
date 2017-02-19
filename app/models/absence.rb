class Absence < ApplicationRecord
  belongs_to :type, class_name: "AbsenceType", foreign_key: :absence_type_id
  belongs_to :status, class_name: "AbsenceStatus", foreign_key: :absence_status_id
  belongs_to :user

  before_save :cal_days

  SECONDS_A_DAY = 60 * 60 * 24
  WEEKDAYS = (1..5)
  def cal_days
    start_date, end_date = self.start.to_date, self.end.to_date
    seconds = (start_date..end_date).reduce(0.0) do |sum, date|
      if week_day?(date)
        if start_date == date
          sum += self.start.seconds_until_end_of_day
        elsif end_date == date
          sum += self.end.seconds_since_midnight
        else
          sum += SECONDS_A_DAY
        end
      else
        sum
      end
    end
    (seconds / SECONDS_A_DAY).round(1)
  end

  def allow_modify?
    AbsenceStatus::PENDING == absence_status_id
  end

  private

  def week_day?(date)
    WEEKDAYS.include?(date.wday)
  end
end
