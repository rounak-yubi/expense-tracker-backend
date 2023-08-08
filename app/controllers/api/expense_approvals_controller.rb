class Api::ExpenseApprovalsController < ApplicationController
  #   before_action :authenticate_user!

  def create
    expense_approval = ExpenseApproval.new(expense_approval_params)
    puts "Outputting expense details: #{expense_approval_params}"
    if expense_approval.save
      render json: { message: 'Expense approval successful!', expense_approval: expense_approval }, status: :created
    else
      render json: { errors: expense_approval.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def expense_approval_params
    params.require(:expense_approval).permit(:expense_id, :approved_by_id, :status, :comments)
  end
end
