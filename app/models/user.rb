class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role, class_name: "UserRole", foreign_key: "user_role_id"
  delegate :admin?, to: :role
  has_one :employee

  after_create :create_employee_profile

  def username
    employee.try(:first_name) || email
  end

  private

  def create_employee_profile
    Employee.create(department: Department.find_by(name: "Staff"), user: self)
  end
end
