class ApplicationController < ActionController::API

  def encode_token(payload)
    JWT.encode(payload, 'secret_key')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 'secret_key', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end
end
