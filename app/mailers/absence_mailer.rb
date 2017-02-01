class AbsenceMailer < ApplicationMailer
  def request_email(user:, absence:, admin:)
    @user, @absence, @admin = user, absence, admin
    mail(to: @admin.email, subject: "#{@user.username}提交了新的请假申请。")
  end

  def status_email(user:, absence:)
    @user, @absence = user, absence
    mail(to: @user.email, subject: "你的假期申请的状态已被批复。")
  end
end
