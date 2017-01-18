class Diary < ApplicationRecord
  belongs_to :employee
  belongs_to :project

  before_save :cal_hours

  SECONDS_AN_HOUR = 60 * 60
  def cal_hours
    self.hours = ((self.end - self.start) / SECONDS_AN_HOUR).round(1)
  end
end
