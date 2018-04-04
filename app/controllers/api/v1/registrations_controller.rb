require 'jwt_encoder_decoder'

module Api
  module V1
    class RegistrationsController < ActionController::API
      def create
        user = User.new(registration_params)

        if user.save
          jwt = JWTEncoderDecoder.encode({ user_id: user.id, username: user.username, email: user.email })
          render json: { token: jwt }, status: :ok
        else
          render json: { errors: user.errors.full_messages }, status: :bad_request
        end
      end

      private

      def registration_params
        params.permit(:email, :username, :password)
      end
    end
  end
end
