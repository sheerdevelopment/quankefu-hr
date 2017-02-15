class EmployeesController < ApplicationController
  include SharedConcern

  before_action :set_genders, only: :edit
  before_action :set_departments, only: :edit, if: :current_admin?

  def edit
    @employee = authorize Employee.includes(EMPLOYEE_RELOAD_FIELDS).find(params[:id])
  end

  def update
    @employee = authorize Employee.find(params[:id])
    if @employee.update_attributes(employee_params)
      flash[:success] = "Profile updated."
      redirect_to edit_employee_path(@employee)
    else
      set_genders
      set_departments if current_admin?
      render :edit
    end
  end

  def index
    redirect_to root_path unless current_admin?
    @employees = Employee.includes(EMPLOYEE_RELOAD_FIELDS).paginate(page: params[:page])
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :middle_name, :last_name, :dob,
      :gender_id, :line1, :line2, :county, :city, :country, :postcode, :mobile,
      :title, :department_id, :avatar)
  end

  def set_genders
    @gender_types ||= Rails.cache.fetch("gender_types", :expires_in => 1.day) do
      Gender.includes(:translations).all
    end
  end

  def set_departments
    @departments ||= Rails.cache.fetch("departments", :expires_in => 1.day) do
      Department.includes(:translations).all
    end
  end
end
