class AddInvoiceNumberToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :invoice_number, :string
  end
end
