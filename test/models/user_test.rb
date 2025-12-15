require "test_helper"
#Tests for user model

class UserTest < ActiveSupport::TestCase

  #checks to see if a user is valid with email and password
  test "user is valid with email and password" do
    user = User.new(
      email: "user@gymvault.com",
      password: "password123"
    )
    assert user.valid?
  end

  #checks to see if a user is invalid without an email
  test "user is invalid without an email" do
    user = User.new(
      password: "password123"
    )
    assert_not user.valid?
  end
end
