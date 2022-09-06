require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Testing Group Validations' do
    before do
        User.destroy_all
        Group.destroy_all
        Expense.destroy_all
        GroupExpense.destroy_all
        @user = User.create!(name: 'Santiago', email: 'user@gmail.com', password: 123_456, role:"user") 
        @group = Group.create!(name: "Food", icon:"http//:image.png", author: @user)
        @group.save
    end
    it 'Name should be valid if it is Food' do
      expect(@group).to be_valid
    end

    it 'Name should not be blank' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it "Name should not be ''" do
      @group.name = ''
      expect(@group).to_not be_valid
    end

    it 'icon should be valid if it is http//:image.png' do
        expect(@group).to be_valid
      end
  
      it 'icon should not be blank' do
        @group.icon = nil
        expect(@group).to_not be_valid
      end
  
      it "icon should not be ''" do
        @group.icon  = ''
        expect(@group).to_not be_valid
      end

      it "icon should not be 1" do
        @group.icon  = 1
        expect(@group).to be_valid
      end

    end
end