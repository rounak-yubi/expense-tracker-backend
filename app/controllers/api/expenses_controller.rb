class Api::ExpensesController < ApplicationController
  def create
    expense = Expense.new(expense_params)

    if expense.save
      render json: { message: 'Expense added successfully!', expense: expense }, status: :created
    else
      render json: { errors: expense.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.permit(:employee_id, :date, :description, :amount, :invoice_number, :supporting_documents)
  end
end
