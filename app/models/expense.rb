class Expense < ApplicationRecord
  belongs_to :employee
  #  has_many_attached :supporting_documents
end
