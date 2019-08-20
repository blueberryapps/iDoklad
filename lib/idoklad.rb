module Idoklad
  API_URL = 'https://app.idoklad.cz'

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :client_id, :client_secret
  end
end

require 'idoklad/contacts'
require 'idoklad/issued_invoices'
require 'idoklad/auth'
require 'idoklad/api_request'
require 'idoklad/fetch_error'
