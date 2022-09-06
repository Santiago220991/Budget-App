require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Testing expense Validations' do
    before do
        User.destroy_all
        Group.destroy_all
        Expense.destroy_all
        GroupExpense.destroy_all
        @user = User.create!(name: 'Santiago', email: 'user@gmail.com', password: 123_456, role:"user") 
        @expense = Expense.create!(name: "KFC", amount:22, author:@user)
        @expense.save
    end
    it 'Name should be valid if it is KFC' do
      expect(@expense).to be_valid
    end

    it 'Name should not be blank' do
      @expense.name = nil
      expect(@expense).to_not be_valid
    end

    it "Name should not be ''" do
      @expense.name = ''
      expect(@expense).to_not be_valid
    end

    it 'amount should be valid if it is 22' do
        expect(@expense).to be_valid
      end
  
      it 'amount should not be blank' do
        @expense.amount= nil
        expect(@expense).to_not be_valid
      end
  
      it "amount should not be ''" do
        @expense.amount  = ''
        expect(@expense).to_not be_valid
      end

      it "amount should not be letters" do
        @expense.amount  = "a"
        expect(@expense).to_not be_valid
      end

    end
end