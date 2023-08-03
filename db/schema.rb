# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_03_063213) do
  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.string "employment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expense_approvals", force: :cascade do |t|
    t.integer "expense_id", null: false
    t.integer "approved_by_id", null: false
    t.string "status"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approved_by_id"], name: "index_expense_approvals_on_approved_by_id"
    t.index ["expense_id"], name: "index_expense_approvals_on_expense_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.date "date"
    t.string "description"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_expenses_on_employee_id"
  end

  add_foreign_key "expense_approvals", "approved_bies"
  add_foreign_key "expense_approvals", "expenses"
  add_foreign_key "expenses", "employees"
end
