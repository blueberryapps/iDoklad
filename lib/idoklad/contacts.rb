module Idoklad
  class Contacts
    class << self
      def list
        Idoklad::ApiRequest.get '/developer/api/v2/Contacts'
      end

      def find_by_idenfitication_number(vat_number)
        Idoklad::ApiRequest.get '/developer/api/v2/Contacts/' + "?filter=IdentificationNumber~eq~#{vat_number}"
      end

      def create(contact)
        Idoklad::ApiRequest.post '/developer/api/v2/Contacts', contact
      end
    end
  end
end
