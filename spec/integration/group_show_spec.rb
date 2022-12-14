require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  describe 'index page' do
    before(:each) do
      User.destroy_all
      Group.destroy_all
      Expense.destroy_all
      GroupExpense.destroy_all
      @user = User.create!(name: 'user', email: 'user@gmail.com', password: 123_456)
      @group = Group.create!(name: 'food', icon: 'url', author: @user)
      @expense = Expense.create!(name: 'KFC', amount: 100, author: @user)
      @group_expense = GroupExpense.create!(group: @group, expense: @expense)
      visit user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Log in'
      visit group_path(id: @group.id)
    end
    it 'should render EXPENSES title' do
      expect(page).to have_content('EXPENSES')
    end
    it 'should render a ADD EXPENSE link' do
      expect(page).to have_content('ADD EXPENSE')
    end
    it 'should redirecto to new expense page' do
      click_link 'ADD EXPENSE'
      expect(page).to have_current_path(new_group_expense_path(group_id: @group.id))
    end
    it 'should render a expense called KFC' do
      expect(page).to have_content('KFC')
    end
    it 'should render a total amount of food' do
      expect(page).to have_content('100')
    end
  end
end
