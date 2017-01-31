class AbsenceMailerPreview < ActionMailer::Preview
  def request_email
    user = User.where(user_role_id: UserRole::EMPLOYEE).sample
    admin = User.where(user_role_id: UserRole::ADMIN).sample
    AbsenceMailer.request_email(user: User.where(user_role_id: UserRole::EMPLOYEE).sample,
      absence: nil, admin: admin)
  end
end
