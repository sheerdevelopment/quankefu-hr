class AbsencePolicy < ApplicationPolicy
  def admin_action?
    user.admin?
  end
end
