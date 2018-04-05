require 'test_helper'

module Api
  module V1
    class PostsControllerTest < ActionDispatch::IntegrationTest
      test "#index" do
        get '/api/v1/posts'

        assert_response :success
        assert_equal json_response.keys, ['posts']
        assert_equal json_response['posts'], Post.all.to_a
      end

      test "#create successfully" do
        user = create(:user,
                      email: "#{Faker::Internet.user_name}@random.com",
                      username: Faker::Internet.user_name,
                      password: '12345678')

        post '/api/v1/posts', params: {
          post: { temperature: 15, location_name: 'New York', unit: 'faherenheit', user_id: user.id }
        }

        assert_response :success
        assert_equal json_response.keys, ['post']
        assert_equal json_response['post']['id'], Post.last.id
      end

      test "#create unsuccessfully" do
        post '/api/v1/posts', params: {
          post: { temperature: 15, location_name: 'New York', unit: 'faherenheit', user_id: nil }
        }

        assert_response :bad_request
        assert json_response.keys, ['errors']
      end
    end
  end
end
