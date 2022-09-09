require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'Testing Group validations and methods' do
    before :all do
      @user = User.new(name: 'Mahmoud', email: 'tester@gmail.com')
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.save
      @group = Group.new(name: 'Shopping', icon: "https://cdn-icons-png.flaticon.com/512/189/189715.png",
        author_id: @user.id)
      @group.save
    end

    after :all do
      User.destroy_all
      Group.destroy_all
    end

    it 'name should be present' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'name must not exceed 80 characters' do
      @group.name = 'h' * 81
      expect(@group).to_not be_valid
    end

    it 'author_id should be present' do
      @group.author_id = nil
      expect(@group).to_not be_valid
    end
  end
end
