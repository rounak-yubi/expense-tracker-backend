class Api::ExpenseApprovalsController < ApplicationController
  # before_action :authenticate_user!

  def update
    expense = Expense.find_by(id: params[:id])
    employee = Employee.find_by(id: expense_approval_params[:approved_by_id])

    if expense && employee && employee.role == 'admin'
      expense_approval = ExpenseApproval.find_or_initialize_by(expense_id: expense.id)

      if expense_approval.update(expense_approval_params)
        render json: { message: 'Expense approval successful!', expense_approval: expense_approval }, status: :created
      else
        render json: { errors: expense_approval.errors.full_messages }, status: :unprocessable_entity
      end
    elsif !employee || employee.role != 'admin'
      render json: { message: 'Access denied' }, status: :forbidden
    else
      render json: { message: 'Expense not found' }, status: :not_found
    end
  end

  def get_expense_detail
    expense_approval = ExpenseApproval.find_by(expense_id: params[:expense_id])
    if expense_approval
      render json: { expense_approval: expense_approval }, status: :ok
    else
      render json: { message: 'Expense approval not found' }, status: :not_found
    end
  end

  private

  def expense_approval_params
    params.require(:expense_approval).permit(:approved_by_id, :status, :comments)
  end
end
