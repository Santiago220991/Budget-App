require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  describe 'index page' do
    before(:each) do
      User.destroy_all
      Group.destroy_all
      Expense.destroy_all
      GroupExpense.destroy_all
      @user = User.create(name: 'user', email: 'user@gmail.com', password: 123_456)
      @group = Group.create!(name: 'food', icon: 'url', author: @user)
      @expense = Expense.create!(name: 'KFC', amount: 100, author: @user)
      @group_expense = GroupExpense.create!(group: @group, expense: @expense)
      visit user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Log in'
      visit groups_path
    end
    it 'should render CATEGORIES title' do
      expect(page).to have_content('CATEGORIES')
    end
    it 'should render a add category link' do
      expect(page).to have_content('ADD CATEGORY')
    end
    it 'should render a Log out button' do
      expect(page).to have_content('Log out')
    end
    it 'should redirect to to new category page' do
      click_link 'ADD CATEGORY'
      expect(page).to have_current_path(new_group_path)
    end
    it 'should render a category called food' do
      expect(page).to have_content('food')
    end
    it 'should render a total amount of food' do
      expect(page).to have_content('$100')
    end
  end
end
