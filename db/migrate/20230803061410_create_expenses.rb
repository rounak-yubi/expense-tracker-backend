class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :date
      t.string :description
      t.decimal :amount

      t.timestamps
    end
  end
end
