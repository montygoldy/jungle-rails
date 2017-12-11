require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do

    it "should have a password and password_confirmation" do
      @user = User.create(
        first_name: "Manpreet",
        last_name: "Sandhu",
        email: "montygoldy2006@gmail.com",
        password: nil,
        password_confirmation: nil
        )
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should have same password and password_confirmation" do
      @user = User.create(
        first_name: "Manpreet",
        last_name: "Sandhu",
        email: "montygoldy2006@gmail.com",
        password: "foobar",
        password_confirmation: "notfoobar"
        )
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should have a unique email" do
      @user1 = User.create(
        first_name: "Manpreet",
        last_name: "Sandhu",
        email: "montygoldy2006@gmail.com",
        password: "foobar",
        password_confirmation: "foobar"
        )

      @user2 = User.create(
        first_name: "Manpreet",
        last_name: "Sandhu",
        email: "MONTYGOLDY2006@GMAIL.com",
        password: "foobar",
        password_confirmation: "foobar"
        )
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it "should have a email" do
      @user = User.create(
        first_name: "Manpreet",
        last_name: "Sandhu",
        email: nil,
        password: "foobar",
        password_confirmation: "notfoobar"
        )
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should have a first name" do
      @user = User.create(
        first_name: nil,
        last_name: "Sandhu",
        email: "montygoldy2006@gmail.com",
        password: "foobar",
        password_confirmation: "notfoobar"
        )
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "should have a last name" do
      @user = User.create(
        first_name: "Manpreet",
        last_name: nil,
        email: "montygoldy2006@gmail.com",
        password: "foobar",
        password_confirmation: "notfoobar"
        )
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should have a password with minimum length of 6 characters" do
      @user = User.create(
        first_name: "Manpreet",
        last_name: nil,
        email: "montygoldy2006@gmail.com",
        password: "foo",
        password_confirmation: "foo"
        )
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should not care about case when searching by email' do
      @user = User.create(
        first_name: "Manpreet",
        last_name: "Sandhu",
        email: "montygoldy2006@gmail.com",
        password: "foobar",
        password_confirmation: "foobar"
        )
      @user.save
      expect(User.authenticate_with_credentials('montyGOLDY2006@gmail.com', 'foobar')).to_not eql(nil)
    end

    it 'should have authenticated email and password' do
      @user = User.create(
        first_name: "Manpreet",
        last_name: "Sandhu",
        email: "montygoldy2006@gmail.com",
        password: "foobar",
        password_confirmation: "foobar"
        )
      @user.save
      expect(User.authenticate_with_credentials(' montygoldy2006@gmail.com ', 'foobar')).to_not eql(nil)
    end
  end
end
