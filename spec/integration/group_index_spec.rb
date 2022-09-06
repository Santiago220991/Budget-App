require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  describe 'index page' do
    before(:each) do
      User.destroy_all
      Group.destroy_all
      Expense.destroy_all
      GroupExpense.destroy_all
      @user = User.create(name: 'user', email: 'user@gmail.com', password: 123_456)
      visit user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Log in'
      visit groups_path
    end
    it 'should render Categories title' do
      expect(page).to have_content('Categories')
    end
    it 'should render a New Category link' do
      expect(page).to have_content('New Category')
    end
    it 'should render a Log out button' do
      expect(page).to have_content('Log out')
    end
    it 'should redirecto to new food page' do
      click_link 'New Category'
      expect(page).to have_current_path(new_group_path)
    end
  end
end