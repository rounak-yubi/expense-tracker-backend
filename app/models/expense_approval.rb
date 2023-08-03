class ExpenseApproval < ApplicationRecord
  belongs_to :expense
  belongs_to :approved_by, class_name: 'Employee'
end
