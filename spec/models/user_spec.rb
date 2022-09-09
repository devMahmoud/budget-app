require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Testing Operation validations and methods' do
    before :all do
      @user = User.new(name: 'Mahmoud', email: 'tester@gmail.com')
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.save
    end

    after :all do
      User.destroy_all
    end

    it 'name should be present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end
  end
end
