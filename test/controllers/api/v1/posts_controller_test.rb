require 'test_helper'

module Api
  module V1
    class PostsControllerTest < ActionDispatch::IntegrationTest
      def setup
        @token = authenticated_token
      end

      test "#index" do
        get '/api/v1/posts', headers: { 'Authorization': "Bearer #{@token}" }

        assert_response :success
        assert_equal json_response.keys, ['posts']
        assert_equal json_response['posts'], Post.all.to_a
      end

      test "#create successfully" do
        post '/api/v1/posts', params: {
          post: { temperature: 15, location_name: 'New York', unit: 'fahrenheit' }
        }, headers: { 'Authorization': "Bearer #{@token}" }

        assert_response :success
        assert_equal json_response.keys, ['post']
      end

      test "#create unsuccessfully" do
        post '/api/v1/posts', params: {
          post: { temperature: nil, location_name: 'New York', unit: 'fahrenheit' }
        }, headers: { 'Authorization': "Bearer #{@token}" }

        assert_response :bad_request
        assert json_response.keys, ['errors']
      end
    end
  end
end
