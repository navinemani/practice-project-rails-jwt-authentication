class JsonWebToken
  SIGNATURE = Rails.application.secrets.secret_key_base

  def self.enconde(payload)
    JWT.encode(payload, SIGNATURE)
  end  

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, SIGNATURE))
  rescue
    nil
  end
end