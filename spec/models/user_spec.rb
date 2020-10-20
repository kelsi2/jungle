require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
      it 'should save if provided with a password and matching password confirmation' do
        @user = User.new(
          first_name: "Kelsi",
          last_name: "Proulx",
          email: "kelsiproulx1919@gmail.com",
          password: "testMe1234",
          password_confirmation: "testMe1234"
        )
        expect(@user).to be_valid
      end

      it 'should not save if password and password confirmation do not match' do
        @user = User.new(
          first_name: "Kelsi",
          last_name: "Proulx",
          email: "kelsiproulx1919@gmail.com",
          password: "testMe1234",
          password_confirmation: "testMe123"
        )
        expect(@user).to_not be_valid
      end

      it 'should not save if missing either password or password confirmation' do
      end

      it 'should not save if password is less than 8 characters' do
      end

      it 'should not save if no email is provided' do
      end

      it 'should not save if no first name is provided' do
      end

      it 'should not save if no last name is provided' do
      end

      it 'should disregard case sensitivity in email' do
      end
    end

  describe '.authenticate_with_credentials' do
    it 'should not save if user name already exists' do
    end

    it 'should return the user if the email is registerd' do
    end

    it 'should not return the user if the email is not registered' do
    end

    it 'should still return the user if email includes leading or trailing whitespace' do
    end
  end
end