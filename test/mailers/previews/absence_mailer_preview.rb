class AbsenceMailerPreview < ActionMailer::Preview
  def request_email
    user = User.where(user_role_id: UserRole::EMPLOYEE).sample
    admin = User.where(user_role_id: UserRole::ADMIN).sample
    AbsenceMailer.request_email(user: user, absence: nil, admin: admin)
  end

  def status_email
    absence = Absence.joins(:user).where("users.user_role_id" => UserRole::EMPLOYEE).sample
    AbsenceMailer.status_email(user: absence.user, absence: absence)
  end
end
