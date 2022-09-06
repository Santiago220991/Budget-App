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
      visit user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Log in'
      visit group_path(id: @group.id)
    end
    it 'should render Expenses title' do
      expect(page).to have_content('Expenses')
    end
    it 'should render a Add Expense link' do
      expect(page).to have_content('Add Expense')
    end
    it 'should render a Log out button' do
      expect(page).to have_content('Log out')
    end
    it 'should redirecto to new expense page' do
      click_link 'Add Expense'
      expect(page).to have_current_path(new_group_expense_path(group_id: @group.id))
    end
  end
end
