class StaticPagesController < ApplicationController
  def home
    @taken_holidays = current_user.taken_holidays
    @work_hours = current_user.employee.work_hours
  end
end
