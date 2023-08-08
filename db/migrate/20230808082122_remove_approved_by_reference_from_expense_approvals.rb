class RemoveApprovedByReferenceFromExpenseApprovals < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :expense_approvals, :approved_bies
  end
end
