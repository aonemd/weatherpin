require 'jwt_encoder_decoder'

module AuthenticatedToken
  def authenticated_token
    user = User.new
    User.stubs(:exists?).returns(true)
    User.stubs(:find_by!).returns(user)

    JWTEncoderDecoder.encode({ user_id: 1 })
  end
end
