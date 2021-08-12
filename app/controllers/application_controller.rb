class ApplicationController < ActionController::API

  def encode_token(payload)
    JWT.encode(payload, 'secret_key')
  end


  def decode_token(payload) 
    begin
      JWT.decode(token[1, token.length - 2], 'secret_key', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end


  def auth_header
    if !(request['headers'] == nil)
      return request['headers']['Authorization']
    else
      return request.headers['Authorization']
    end
  end
  

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token[1, token.length - 2], 'secret_key', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end
end

