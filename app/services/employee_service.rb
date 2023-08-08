class EmployeeService
  def initialize(employee_params)
    @employee_params = employee_params
  end

  def create_employee
    employee = Employee.new(@employee_params)

    if employee.save
      { success: true, employee: employee }
    else
      { success: false, errors: employee.errors.full_messages }
    end
  end
end
