require 'rails_helper'

RSpec.describe Operation, type: :model do
  context 'Testing Operation validations and methods' do
    before :all do
      @user = User.new(name: 'Mahmoud', email: 'tester@gmail.com')
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.save
      @operation = Operation.new(name: 'Snacks', amount: 30, author_id: @user.id)
      @operation.save
    end

    after :all do
      User.destroy_all
      Operation.destroy_all
    end

    it 'name should be present' do
      @operation.name = nil
      expect(@operation).to_not be_valid
    end

    it 'name must not exceed 80 characters' do
      @operation.name = 'h' * 81
      expect(@operation).to_not be_valid
    end

    it 'author_id should be present' do
      @operation.author_id = nil
      expect(@operation).to_not be_valid
    end
  end
end
