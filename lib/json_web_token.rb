require 'jwt'

class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.secret_key_base)[0]
  end
end
