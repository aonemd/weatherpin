require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "validate presence of username and email" do
    user = build(:user, email: nil, username: nil)

    assert_equal user.valid?, false
  end

  test "validate format of email contains an @" do
    user = build(:user, email: 'hellworld')

    assert_equal user.valid?, false
  end
end
