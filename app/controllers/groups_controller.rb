class GroupsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  def index
    @groups = Group.where(author_id: current_user).order(created_at: :desc)
    @total_arr = []
    @groups.each do |group|
      @expenses = Expense.joins(:group_expenses,
                                :groups).where(group_expenses: { group_id: group.id }).group(:amount).sum(:amount)
      @total_arr << @expenses.values.sum
    end
  end

  def show
    @expenses = []
    @group_expenses = GroupExpense.where(group_id: params[:id]).order(created_at: :desc)
    @total = 0
    @group_expenses.each do |element|
      @expense = Expense.find(element.expense_id)
      @total += @expense.amount
      @expenses << @expense
    end
  end

  def new
    Group.new
  end

  def create
    @group = Group.new
    @group.name = params[:name]
    @group.icon = params[:icon]
    @group.author = current_user
    if @group.save!
      redirect_to groups_path, notice: 'New category created'
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group=Group.find(params[:id])
    @group.name=params[:group][:name]
    @group.icon=params[:group][:icon]
    if @group.save!
      redirect_to groups_path, notice: 'Category Updated'
    else
      render 'update'
    end
  end

  def destroy
    group = Group.find(params[:id])
    redirect_to groups_path if Group.destroy(group.id)
  end
end
