class Api::EmployeesController < ApplicationController
  def create
    employee = Employee.new(employee_params)

    if employee.save
      render json: { message: 'Employee onboarding successful!', employee: employee }, status: :created
    else
      render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :department, :employment_status)
  end
end
