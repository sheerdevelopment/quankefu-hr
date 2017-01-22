class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    user.admin? || record.user_id == user.id
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin? ||
    (
      record.user_id == user.id &&
      (!record.respond_to?(:allow_modify?) || record.allow_modify?)
    )
  end

  def update?
    edit?
  end

  def destroy?
    create?
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
        scope.where(user: user)
      end
    end
  end
end
