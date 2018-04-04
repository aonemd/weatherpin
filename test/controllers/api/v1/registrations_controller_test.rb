require 'test_helper'

module Api
  module V1
    class RegistrationsControllerTest < ActionDispatch::IntegrationTest
      test "sign up successfully" do
        post '/api/v1/sign_up', params: {
          email: "#{Faker::Internet.user_name}@random.com",
          username: Faker::Internet.user_name,
          password: '12345678'
        }

        assert_response :success
        assert_equal json_response.keys, ['token']
      end

      test "sign up unsuccessfully" do
        post '/api/v1/sign_up', params: {
          email: nil,
          username: Faker::Internet.user_name,
          password: '12345678'
        }

        assert_response :bad_request
      end
    end
  end
end
