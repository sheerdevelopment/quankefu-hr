class UserRole < ApplicationRecord
  translates :name

  ADMIN = 1
  MANAGER = 2
  EMPLOYEE = 3

  def admin?
    id == ADMIN
  end
end
