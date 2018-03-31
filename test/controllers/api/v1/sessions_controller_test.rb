require 'test_helper'

module Api
  module V1
    class SessionsControllerTest < ActionDispatch::IntegrationTest
      def setup
        @user = create(:user,
                      email: "#{Faker::Internet.user_name}@random.com",
                      username: Faker::Internet.user_name,
                      password: '12345678')
      end

      test "login successfully by email" do
        post '/api/v1/login', params: { identity: @user.email,
                                        password: '12345678' }

        assert_response :success
        assert_equal json_response.keys, ['token']
      end

      test "login successfully by username" do
        post '/api/v1/login', params: { identity: @user.username,
                                        password: '12345678' }

        assert_response :success
        assert_equal json_response.keys, ['token']
      end

      test "login unsuccessfully by email" do
        post '/api/v1/login', params: { identity: @user.email,
                                        password: 'wrong password' }

        assert_response :unauthorized
      end
    end
  end
end
