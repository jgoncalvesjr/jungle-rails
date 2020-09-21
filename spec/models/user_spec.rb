require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before :each do
      @user = User.new(
        first_name: 'Leeroy',
        last_name: 'Jenkins',
        email: 'power@overwhelming.com',
        password: 'mimimi',
        password_confirmation: 'mimimi'
      )
    end

    it 'should save when password and password_confirmation are the same' do
      @user.save
      expect(@user).to be_valid
      expect(@user.id).to be_present
    end

    it 'should not save when password and password_confirmation do not match' do
      @user.password_confirmation = 'trololol'
      @user.save
      expect(@user).to_not be_valid
      expect(@user.id).to_not be_present
      expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
    end

    it 'should not save when password is too short' do
      @user.password = 'memes'
      @user.password_confirmation = 'memes'
      @user.save
      expect(@user).to_not be_valid
      expect(@user.id).to_not be_present
      expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 6 characters)")
    end

    it 'should not save when first name is blank' do
      @user.first_name = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.id).to_not be_present
      expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
    end

    it 'should not save when last name is blank' do
      @user.last_name = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.id).to_not be_present
      expect(@user.errors.full_messages[0]).to eq("Last name can't be blank")
    end

    it 'should not save when e-mail is blank' do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.id).to_not be_present
      expect(@user.errors.full_messages[0]).to eq("Email can't be blank")
    end

    it 'should not allow a new user with the same e-mail' do
      @user.save
      @other_user = User.new(
        first_name: 'Protoss',
        last_name: 'Zeratul',
        email: 'power@overwhelming.com',
        password: 'starcraft',
        password_confirmation: 'starcraft'
      )
      expect(@other_user).to_not be_valid
      expect(@other_user.id).to_not be_present
      expect(@other_user.errors.full_messages[0]).to eq("Email has already been taken")
    end

    it 'should not allow a new user with the same e-mail and the check should be case sensitive' do
      @user.save
      @other_user = User.new(
        first_name: 'Protoss',
        last_name: 'Zeratul',
        email: 'POWER@overWhelming.cOm',
        password: 'starcraft',
        password_confirmation: 'starcraft'
      )
      expect(@other_user).to_not be_valid
      expect(@other_user.id).to_not be_present
      expect(@other_user.errors.full_messages[0]).to eq("Email has already been taken")
    end

  end
  
  describe '.authenticate_with_credentials' do

    before :each do
      @user = User.new(
        first_name: 'Leeroy',
        last_name: 'Jenkins',
        email: 'power@overwhelming.com',
        password: 'mimimi',
        password_confirmation: 'mimimi'
      )
      @user.save
    end

    it 'should log a user in with valid credentials' do
      @log_user = User.authenticate_with_credentials('power@overwhelming.com', 'mimimi')
      expect(@log_user).to eq(@user)
    end

    it 'should not log a user if password does not match' do
      @log_user = User.authenticate_with_credentials('power@overwhelming.com', 'password')
      expect(@log_user).to be_nil
      expect(@log_user).to_not eq(@user)
    end

    it 'should not log a user if email does not match' do
      @log_user = User.authenticate_with_credentials('power@whelming.com', 'mimimi')
      expect(@log_user).to be_nil
      expect(@log_user).to_not eq(@user)
    end

    it 'should log a user in with valid credentials, even if email contains whitespaces' do
      @log_user = User.authenticate_with_credentials('   power@overwhelming.com   ', 'mimimi')
      expect(@log_user).to eq(@user)
    end

    it 'should log a user in with valid credentials, even if email is incorrectly cased' do
      @log_user = User.authenticate_with_credentials('POWER@OVERwhelming.cOm', 'mimimi')
      expect(@log_user).to eq(@user)
    end
  
  end
end
