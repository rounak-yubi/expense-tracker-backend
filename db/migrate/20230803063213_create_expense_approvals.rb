class CreateExpenseApprovals < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_approvals do |t|
      t.references :expense, null: false, foreign_key: true
      t.references :approved_by, null: false, foreign_key: true
      t.string :status
      t.text :comments

      t.timestamps
    end
  end
end
