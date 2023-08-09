# app/controllers/concerns/employee_params_utils.rb
module EmployeeParamsUtils
  extend ActiveSupport::Concern

  private

  def employee_params
    params.require(:employee).permit(:name, :department, :employment_status)
  end
end
