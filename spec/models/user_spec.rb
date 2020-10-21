require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
      it 'should save if provided with a password and matching password confirmation' do
        @user = User.new(
          first_name: "Carlisle",
          last_name: "Testerson",
          email: "test@gmail.com",
          password: "testMe1234",
          password_confirmation: "testMe1234"
        )
        expect(@user).to be_valid
      end

      it 'should not save if password and password confirmation do not match' do
        @user = User.new(
          first_name: "Carlisle",
          last_name: "Testerson",
          email: "test@gmail.com",
          password: "testMe1234",
          password_confirmation: "testMe123"
        )
        expect(@user).to_not be_valid
      end

      it 'should not save if missing either password or password confirmation' do
        @user = User.new(
          first_name: "Carlisle",
          last_name: "Testerson",
          email: "test@gmail.com",
          password: "testMe1234",
          password_confirmation: nil
        )
        expect(@user).to_not be_valid
      end

      it 'should not save if password is less than 8 characters' do
        @user = User.new(
          first_name: "Carlisle",
          last_name: "Testerson",
          email: "test@gmail.com",
          password: "testMe",
          password_confirmation: "testMe"
        )
        expect(@user).to_not be_valid
      end

      it 'should not save if no email is provided' do
        @user = User.new(
          first_name: "Carlisle",
          last_name: "Testerson",
          email: nil,
          password: "testMe1234",
          password_confirmation: "testMe1234"
        )
        expect(@user).to_not be_valid
      end

      it 'should not save if no first name is provided' do
        @user = User.new(
          first_name: nil,
          last_name: "Testerson",
          email: "test@gmail.com",
          password: "testMe1234",
          password_confirmation: "testMe1234"
        )
        expect(@user).to_not be_valid
      end

      it 'should not save if no last name is provided' do
        @user = User.new(
          first_name: "Carlisle",
          last_name: nil,
          email: "test@gmail.com",
          password: "testMe1234",
          password_confirmation: "testMe1234"
        )
        expect(@user).to_not be_valid
      end
    end

  describe '.authenticate_with_credentials' do
    it 'should disregard case sensitivity in email' do
        @user = User.create(
          first_name: "Carlisle",
          last_name: "Testerson",
          email: "test@gmail.com",
          password: "testMe1234",
          password_confirmation: "testMe1234"
        )
        @user = User.authenticate_with_credentials("TEst@GMAIL.com", "testMe1234")
        expect(@user).to_not be_nil
      end

    it 'should not save if user already exists' do
      @user = User.create(
          first_name: "Carlisle",
          last_name: "Testerson",
          email: "test@gmail.com",
          password: "testMe1234",
          password_confirmation: "testMe1234"
        )
        @user = User.new(
          first_name: "Carlisle",
          last_name: "Testerson",
          email: "test@gmail.com",
          password: "testMe1234",
          password_confirmation: "testMe1234"
        )
        expect(@user).to_not be_valid
    end

    it 'should return the user if the email is registerd' do
      @user = User.create(
          first_name: "Carlisle",
          last_name: "Testerson",
          email: "test@gmail.com",
          password: "testMe1234",
          password_confirmation: "testMe1234"
        )
        @user = User.authenticate_with_credentials("test@gmail.com", "testMe1234")
        expect(@user.first_name).to eq("Carlisle")
    end

    it 'should not return the user if the email is not registered' do
      @user = User.authenticate_with_credentials("test@gmail.com", "testMe1234")
      expect(@user).to eq(nil)
    end
  end
end