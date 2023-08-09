class Api::ExpensesController < ApplicationController
  def create
    service = ExpenseService.new(expense_params)
    result = service.create
    if result[:success]
      invoice_result = create_invoice(expense_params[:invoice_number])
      if invoice_result[:success]
        expense_approval = ExpenseApproval.find_or_initialize_by(expense_id: result[:expense].id)
        expense_approval.status = if invoice_result[:response]['status']
                                    'approved'
                                  else
                                    'rejected'
                                  end
        expense_approval.comments = "#{expense_approval.status} by admin"
        expense_approval.approved_by_id = 1
        # if expense_approval.save
        #   puts 'Expense Approval saved successfully'
        # else
        #   puts "Error saving Expense Approval: #{expense_approval.errors.full_messages}"
        # end
      end

      render json: { message: 'Expense added successfully!', expense: result[:expense] }, status: :created
    else
      render json: { errors: result[:errors] }, status: :unprocessable_entity
    end
  end

  def user_expenses
    user_expenses = Expense.where(employee_id: params[:user_id])
    render json: { expenses: user_expenses }, status: :ok
  end

  def create_invoice(invoice_number)
    service = ExpenseService.new(nil)  # Initialize the service without expense_params
    service.create_invoice_with_third_party_api(invoice_number)
  end

  private

  def expense_params
    params.permit(:employee_id, :date, :description, :amount, :invoice_number, :supporting_documents)
  end
end
