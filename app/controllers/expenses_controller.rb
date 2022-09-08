class ExpensesController < ApplicationController
  load_and_authorize_resource
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new
    @expense.name = params[:name]
    @expense.amount = params[:amount]
    @expense.author = current_user
    if @expense.save!
      @group_expense = GroupExpense.new
      @group_expense.group_id = params[:group_id]
      @group_expense.expense_id = @expense.id
      if @group_expense.save!
        redirect_to group_path(id: params[:group_id]), notice: 'New expense created'
      else
        :new
      end
    else
      :new
    end
  end
end
