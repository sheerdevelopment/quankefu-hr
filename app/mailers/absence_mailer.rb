class AbsenceMailer < ApplicationMailer

  def request_email(user:, absence:, admin:)
    @user, @absence, @admin = user, absence, admin
    mail(to: @admin.email, subject: "#{@user.username} has submitted a new absence request.")
  end

end
