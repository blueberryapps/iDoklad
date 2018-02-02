module Idoklad
  class Contacts
    class << self
      def list
        response = Idoklad::ApiRequest.get '/developer/api/v2/Contacts'
        Idoklad::Processor.process_data response.body
      end

      def find_by_idenfitication_number(vat_number)
        response = Idoklad::ApiRequest.get '/developer/api/v2/Contacts/' + "?filter=IdentificationNumber~eq~#{vat_number}"
        Idoklad::Processor.process_data response.body
      end

      def create(contact)
        response = Idoklad::ApiRequest.post '/developer/api/v2/Contacts', contact
        Idoklad::Processor.process_data response.body
      end
    end
  end
end
