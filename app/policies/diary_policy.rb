class DiaryPolicy < ApplicationPolicy
  def edit?
    user.admin? ||
    (
      record.employee_id == user.employee.id &&
      (!record.respond_to?(:allow_modify?) || record.allow_modify?)
    )
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(employee: user.employee)
      end
    end
  end
end
