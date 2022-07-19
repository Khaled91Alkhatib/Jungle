require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'should pass if all fields are correctly filled' do
      @user = User.new(name: 'khaled', email:'123@mail.com', password: '1234567', password_confirmation: '1234567')
      expect(@user).to be_valid
    end
    
    it 'should have a password' do
      @user = User.new(name: 'khaled', email:'123@mail.com', password: nil, password_confirmation: '1234567')
      expect(@user).to_not be_valid
    end

    it 'should have password confirmation' do
      @user = User.new(name: 'khaled', email:'123@mail.com', password: '1234567', password_confirmation: nil)
      expect(@user).to_not be_valid
    end

    it 'should have the same password and password confirmation' do
      @user = User.new(name: 'khaled', email: '123@mail.com', password: '1234567', password_confirmation: '12345678')
      expect(@user).to_not be_valid
    end

    it 'should have unique email for every user and not case sensitive' do
      @first_user = User.new(name: 'khaled', email: '123@mail.com', password: '1234567', password_confirmation: '1234567')
      expect(@first_user).to be_valid
      @first_user.save
      @second_user = User.new(name: 'john', email: '123@mAIl.com', password: '12345678', password_confirmation: '12345678')
      expect(@second_user).to_not be_valid
    end

    it 'should have an email' do
      @user = User.new(name: 'khaled', email: nil, password: '1234567', password_confirmation: '1234567')
      expect(@user).to_not be_valid
    end

    it 'should have a name' do
      @user = User.new(name: nil, email: '123@mail.com', password: '1234567', password_confirmation: '1234567')
      expect(@user).to_not be_valid
    end

    it 'should have a password of at least 7 characters' do
      @user = User.new(name: 'khaled', email: '123@mail.com', password: '123456', password_confirmation: '123456')
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it 'should return user if they exist' do
      @user = User.new(name:'khaled', email:'123@mail.com', password: '1234567', password_confirmation: '1234567')
      expect(@user).to be_valid
      @user.save
      @loginUser = User.authenticate_with_credentials '123@mail.com', '1234567'
      expect(@user).to match @loginUser
    end

    it 'should return nil if user does not exist' do
      @user = User.new(name:'khaled', email:'123@mail.com', password: '1234567', password_confirmation: '1234567')
      expect(@user).to be_valid
      @user.save
      @loginUser = User.authenticate_with_credentials '1234@mail.com', '1234567'
      expect(@loginUser).to be_nil
    end

    it 'should not take case sensitivity into account and return user' do
      @user = User.new(name:'khaled', email:'123@mail.com', password: '1234567', password_confirmation: '1234567')
      expect(@user).to be_valid
      @user.save
      @loginUser = User.authenticate_with_credentials '123@mAIl.com', '1234567'
      expect(@user).to match @loginUser
    end

    it 'should disregard whitespaces' do
      @user = User.new(name:'khaled', email:'123@mail.com', password: '1234567', password_confirmation: '1234567')
      expect(@user).to be_valid
      @user.save
      @loginUser = User.authenticate_with_credentials ' 123@mail.com ', '1234567'
      expect(@user).to match @loginUser
    end
    
  end
end