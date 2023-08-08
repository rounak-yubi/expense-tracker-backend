# app/services/expense_service.rb
class ExpenseService
  def initialize(expense_params)
    @expense_params = expense_params
  end

  def create
    expense = Expense.new(@expense_params)

    if expense.save
      { success: true, expense: expense }
    else
      { success: false, errors: expense.errors.full_messages }
    end
  end
end
