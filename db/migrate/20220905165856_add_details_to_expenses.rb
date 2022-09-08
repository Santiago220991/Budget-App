class AddDetailsToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :name, :string
    add_column :expenses, :amount, :integer
  end
end
