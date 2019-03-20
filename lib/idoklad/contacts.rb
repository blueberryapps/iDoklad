module Idoklad
  class Contacts
    class << self
      def list
        Idoklad::ApiRequest.get '/developer/api/v2/Contacts'
      end

      def find_by(column, value)
        query_params = "filter=#{column}~eq~#{value}"
        response = Idoklad::ApiRequest.get "/developer/api/v2/Contacts/?#{query_params}"
        response['Data'].first
      end

      def create(contact)
        Idoklad::ApiRequest.post '/developer/api/v2/Contacts', contact
      end
    end
  end
end
