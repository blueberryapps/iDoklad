module Idoklad
  class IssuedInvoices
    class << self
      def list
        Idoklad::ApiRequest.get '/developer/api/v2/IssuedInvoices'
      end

      def default
        Idoklad::ApiRequest.get '/developer/api/v2/IssuedInvoices/Default'
      end

      def create(attributes)
        Idoklad::ApiRequest.post '/developer/api/v2/IssuedInvoices', attributes
      end

      def update(id, attributes)
        Idoklad::ApiRequest.patch "/developer/api/v2/IssuedInvoices/#{id}",
                                  attributes
      end
    end
  end
end
