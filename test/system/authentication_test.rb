require "application_system_test_case"

class AuthenticationTest < ApplicationSystemTestCase
  test "sign up" do
    visit '/#/sign-up'

    fill_in 'sign-up__email',  with: 'randy@weather.pin'
    fill_in 'sign-up__username', with: 'randy'
    fill_in 'sign-up__password', with: '12345678'
    click_button 'Sign up'

    assert_selector 'li', 'randy'
    assert_selector 'a', 'Sign Out'
  end

  test "sign in with email" do
    user = create(:user)

    visit '/#/sign-in'

    fill_in 'sign-in__identity',  with: user.email
    fill_in 'sign-in__password', with: '12345678'
    click_button 'Sign in'

    assert_selector 'li', user.username
    assert_selector 'a', 'Sign Out'
  end

  test "sign in with username" do
    user = create(:user)

    visit '/#/sign-in'

    fill_in 'sign-in__identity',  with: user.username
    fill_in 'sign-in__password', with: '12345678'
    click_button 'Sign in'

    assert_selector 'li', user.username
    assert_selector 'a', 'Sign Out'
  end
end
