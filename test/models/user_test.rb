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

  test "validate format of username" do
    user = build(:user, username: 'hell@yeah')

    assert_equal user.valid?, false
  end

  test "#find_by_identity using email" do
    created_user = create(:user,
                   email: "#{Faker::Internet.user_name}@random.com",
                   username: Faker::Internet.user_name,
                   password: '12345678')

    user = User.find_by_identity(created_user.email)

    assert_instance_of User, user
  end
end
