class AbsenceMailer < ApplicationMailer
  def request_email(user:, absence:, admin:)
    @user, @absence, @admin = user, absence, admin
    mail(to: @admin.email, subject: "#{@user.username} has submitted a new absence request.")
  end

  def status_email(user:, absence:)
    @user, @absence = user, absence
    mail(to: @user.email, subject: "Your absence request has been updated.")
  end
end
