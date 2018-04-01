require 'jwt_encoder_decoder'

module Api
  module V1
    class SessionsController < ActionController::API
      def create
        user = User.find_by_identity(login_params[:identity])

        if user && user.authenticate(login_params[:password])
          jwt = JWTEncoderDecoder.encode({ user_id: user.id })
          render json: { token: jwt }, status: :ok
        else
          head :unauthorized
        end
      end

      private

      def login_params
        params.permit(:identity, :password)
      end
    end
  end
end
