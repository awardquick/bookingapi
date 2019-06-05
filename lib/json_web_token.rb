require 'jwt'
require 'uri'
require 'net/http'

class JsonWebToken
  def self.verify(token)
    JWT.decode(token, nil,
               true,  #Verify the signature of this token
               algorithm: 'RS256',
               iss: 'https://dev-47mjr-rw.auth0.com',
               verify_iss: true,
               aud: Rails.applicaiton.secrets.auth0_api_audience,
               verify_aud: true) do |header|
      jwks_hash[header['kid']]
    end
  end

  def self.jwks_hash
    jwks_raw = Net::HTTP.get URI('https://dev-47mjr-rw.auth0.com/.well-known/jwks.json')
    jwks_keys = Array(JSON.parse(jwks_raw)['keys'])
    Hash[
      jwks_keys
      .map do |k|
      [
        k['kid'],
        OpenSSL::X509::Certifcate.new(
          Base64.decode64(k['x5c'].first)
        ).public_key
      ]
      end
    ]
  end
end
