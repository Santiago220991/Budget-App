class GroupsController < ApplicationController
    def index
        @groups=Group.where(author_id: current_user).order(created_at: :desc)
        @total_arr=[]
        @groups.each do |group|
        @expenses=Expense.joins(:group_expenses, :groups).where(:group_expenses => {:group_id => group.id}).group(:amount).sum(:amount)
        @total_arr<<@expenses.values
        end
    end
    
    def show
        @expenses=[]
        @group_expenses=GroupExpense.where(group_id: params[:id]).order(created_at: :desc)
        @total=0
        @group_expenses.each do |element|
            @expense=Expense.find(element.expense_id)
            @total+=@expense.amount
            @expenses<<@expense
        end
        
    end

    def new
        Group.new
    end
    
    def create
        @group=Group.new()
        @group.name=params[:name]
        @group.icon=params[:icon]
        @group.author=current_user
        if @group.save!
            redirect_to root_path, notice: "New category created"
        else
         render  "new"
        end
    end
end
