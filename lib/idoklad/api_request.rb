require 'json'
require 'rest-client'

module Idoklad
  module ApiRequest
    class << self
      def get(path)
        response = RestClient.get("#{Idoklad::API_URL}#{path}", authorization)
        JSON.parse(response.body)
      rescue RestClient::ExceptionWithResponse => e
        raise FetchError, e.response
      end

      def post(path, object)
        headers  = { content_type: :json }.merge(authorization)
        endpoint = "#{Idoklad::API_URL}#{path}"
        response = RestClient.post(endpoint, JSON.generate(object), headers)

        JSON.parse(response.body)
      rescue RestClient::ExceptionWithResponse => e
        raise FetchError, e.response
      end

      def patch(path, object)
        headers  = { content_type: :json }.merge(authorization)
        endpoint = "#{Idoklad::API_URL}#{path}"
        response = RestClient.patch(endpoint, JSON.generate(object), headers)

        JSON.parse(response.body)
      rescue RestClient::ExceptionWithResponse => e
        raise FetchError, e.response
      end

      private

      def authorization
        { 'Authorization' => "Bearer #{Idoklad::Auth.get_token}" }
      end
    end
  end
end
