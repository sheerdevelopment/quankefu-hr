class Absence < ApplicationRecord
  belongs_to :absence_type
  belongs_to :absence_status
  belongs_to :user

  before_save :cal_days

  alias :type :absence_type

  SECONDS_A_DAY = 60 * 60 * 24
  def cal_days
    self.days = ((self.end - self.start) / SECONDS_A_DAY).round(2)
  end
end
