class EmployeesController < ApplicationController
  def edit
    @employee = Employee.find(params[:id])
  end

  def update

  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :middle_name, :last_name)
  end
end
