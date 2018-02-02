module Idoklad
  class IssuedInvoices
    class << self
      def list
        response = Idoklad::ApiRequest.get '/developer/api/v2/IssuedInvoices'
        Idoklad::Processor.process_data response.body
      end

      def default
        response = Idoklad::ApiRequest.get '/developer/api/v2/IssuedInvoices/Default'
        Idoklad::Processor.process_data response.body
      end

      def create(invoice)
        response = Idoklad::ApiRequest.post '/developer/api/v2/IssuedInvoices', invoice
        Idoklad::Processor.process_data response.body
      end
    end
  end
end
