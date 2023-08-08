class Api::EmployeesController < ApplicationController
  include EmployeeParamsUtils

  def create
    service = EmployeeService.new(employee_params)
    result = service.create_employee

    if result[:success]
      render json: { message: 'Employee onboarding successful!', employee: result[:employee] }, status: :created
    else
      render json: { errors: result[:errors] }, status: :unprocessable_entity
    end
  end
end
