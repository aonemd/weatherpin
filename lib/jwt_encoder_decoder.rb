module JWTEncoderDecoder
  def self.encode(payload, expires_in: 1.months.from_now)
    payload[:exp] = expires_in.to_i

    JWT.encode(
      payload,
      Rails.application.secrets.secret_key_base
    )
  end

  def self.decode(token)
    payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
    HashWithIndifferentAccess.new payload
  rescue
    nil
  end

  def self.expired?(payload)
    Time.at(payload[:exp]) < Time.now
  end
end
