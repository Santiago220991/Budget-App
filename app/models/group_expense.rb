class GroupExpense < ApplicationRecord
    belongs_to :expense, dependent: :destroy
    belongs_to :group
  end
  