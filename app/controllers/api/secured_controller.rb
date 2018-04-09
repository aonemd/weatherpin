require 'jwt_encoder_decoder'

module Api
  class SecuredController < BaseController
    before_action :authenticate_user

    protected

    def authenticate_user
      unauthorized! unless valid_header? && valid_payload?
    end

    def current_user
      @current_user ||= User.find_by!(id: payload[:user_id])
    end

    def unauthorized!
      render json: { errors: ['Unauthenticated'] }, status: :unauthorized
    end

    private

    def valid_header?
      !!request.env.fetch('HTTP_AUTHORIZATION', '').scan(/Bearer/).flatten.first
    end

    def valid_payload?
      payload && User.exists?(id: payload[:user_id]) && !JWTEncoderDecoder.expired?(payload)
    end

    def payload
      @payload ||= JWTEncoderDecoder.decode(token)
    end

    def token
      request.env.fetch('HTTP_AUTHORIZATION', '').scan(/Bearer (.*)$/).flatten.last
    end
  end
end
