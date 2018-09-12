module Api
  module V1
    class PostsController < SecuredController
      def index
        posts =
          PostDecorator.decorate_collection(Post.includes(:user).order(created_at: :desc))

        render json: { posts: posts }
      end

      def create
        post = current_user.posts.new(post_params)

        if post.save
          render json: { post: PostDecorator.new(post).decorate }
        else
          render json: { errors: post.errors.full_messages }, status: :bad_request
        end
      end

      private

      def post_params
        params.require(:post).permit(:temperature, :location_name, :unit)
      end
    end
  end
end
