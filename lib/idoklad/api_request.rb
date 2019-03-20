require 'json'

module Idoklad
  module ApiRequest
    class << self
      def get(path)
        response = client.get(path, authorization)
        JSON.parse response.body
      end

      def post(path, object)
        headers = {'Content-type' => 'application/json'}.merge(authorization)
        response = client.post(path, JSON.generate(object), headers)
        JSON.parse response.body
      end

      def patch(path, object)
        headers = {'Content-type' => 'application/json'}.merge(authorization)
        response = client.patch(path, JSON.generate(object), headers)
        JSON.parse response.body
      end

      private

      def authorization
        {'Authorization' => "Bearer #{Idoklad::Auth.get_token}" }
      end

      def client
        @client ||= begin
          uri = URI.parse(Idoklad::API_URL)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          http
        end
      end
    end
  end
end
