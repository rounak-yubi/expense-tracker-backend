class AddSupportingDocumentsToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :supporting_documents, :json
  end
end
