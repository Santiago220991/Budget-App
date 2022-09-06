class Expense < ApplicationRecord
    belongs_to :author, class_name:"User"
    has_many :group_expenses, dependent: :destroy
    has_many :groups, through: :group_expenses

    validates :name, presence:true
    validates :amount, presence:true, numecarility: {:greater_than: 0}
  end
  