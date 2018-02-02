require 'json'

module Idoklad
  module ApiRequest

    def self.get(path)
      uri = URI.parse("#{Idoklad::API_URL}#{path}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.get(uri.request_uri, {'Authorization' => "Bearer #{token}"})
    end

    def self.post(path, object)
      uri = URI.parse("#{Idoklad::API_URL}#{path}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.post(uri.request_uri, JSON.generate(object), {'Authorization' => "Bearer #{token}", 'Content-type' => 'application/json'})
    end

    def self.token
      @tokens ||= {}
      if @tokens.key?(Idoklad::configuration.client_id)
        @tokens[Idoklad::configuration.client_id]
      else
        @tokens[Idoklad::configuration.client_id] = Idoklad::Auth.get_token
      end
    end
  end
end
