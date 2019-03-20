require 'oauth2'

module Idoklad
  module Auth
    AUTHORIZE_URL = '/identity/server/connect/authorize'
    TOKEN_URL = '/identity/server/connect/token'
    SCOPE = 'idoklad_api'

    class << self
      def get_token
        @tokens ||= {}
        @tokens[Idoklad.configuration.client_id] ||= token
      end

      def token
        client = OAuth2::Client.new(
          Idoklad.configuration.client_id,
          Idoklad.configuration.client_secret,
          :authorize_url => AUTHORIZE_URL,
          :token_url     => TOKEN_URL,
          :site          => Idoklad::API_URL
        )

        token = client.client_credentials.get_token(:scope => SCOPE)
        token.token
      end
    end
  end
end
