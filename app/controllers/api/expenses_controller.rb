class Api::ExpensesController < ApplicationController
  def create
    service = ExpenseService.new(expense_params)
    result = service.create

    if result[:success]
      render json: { message: 'Expense added successfully!', expense: result[:expense] }, status: :created
    else
      render json: { errors: result[:errors] }, status: :unprocessable_entity
    end
  end

  def index_by_user
    user_expenses = Expense.where(employee_id: params[:user_id])
    render json: { expenses: user_expenses }, status: :ok
  end

  private

  def expense_params
    params.permit(:employee_id, :date, :description, :amount, :invoice_number, :supporting_documents)
  end
end
