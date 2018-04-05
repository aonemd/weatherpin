module Api
  module V1
    class PostsController < ActionController::API
      def index
        posts = Post.all

        render json: { posts: posts }
      end

      def create
        post = Post.new(post_params)

        if post.save
          render json: { post: post }
        else
          render json: { errors: post.errors.full_messages }, status: :bad_request
        end
      end

      private

      def post_params
        params.require(:post).permit(:temperature, :location_name, :units, :user_id)
      end
    end
  end
end
