require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Testing User Validations' do
    before do
      User.destroy_all
      Group.destroy_all
      Expense.destroy_all
      GroupExpense.destroy_all
      @user = User.create!(name: 'Santiago', email: 'user@gmail.com', password: 123_456, role: 'user')
      @user.save
    end
    it 'Name should be valid if it is Santiago' do
      expect(@user).to be_valid
    end

    it 'Name should not be blank' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it "Name should not be ''" do
      @user.name = ''
      expect(@user).to_not be_valid
    end

    it 'email should be valid if it is user@gmail.com' do
      expect(@user).to be_valid
    end

    it 'email should not be blank' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "email should not be ''" do
      @user.email = ''
      expect(@user).to_not be_valid
    end

    it 'role should be valid if it is user' do
      expect(@user).to be_valid
    end

    it 'role should not be blank' do
      @user.email = nil
      expect(@user).to_not be_valid
    end
  end
end
