class Diary < ApplicationRecord
  belongs_to :employee
  belongs_to :project

  before_save :cal_hours
  delegate :user, to: :employee

  SECONDS_AN_HOUR = 60 * 60
  def cal_hours
    self.hours = ((self.end - self.start) / SECONDS_AN_HOUR).round(1)
  end

  def allow_modify?
    ProjectStatus::IN_PROGRESS == project_status_id
  end
end
