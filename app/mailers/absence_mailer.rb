class AbsenceMailer < ApplicationMailer

  def request_email(user:, absence:, admin)
    @user, @absence, @admin = user, absence, admin
    mail(to: @admin.email, subject: t("absence_mailer.request.subject, name: #{@user.username}"))
  end

end
