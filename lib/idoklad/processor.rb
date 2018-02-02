require 'json'
require 'hashie'

module  Idoklad
  module Processor
    def self.process_data(data)
      data = Hashie::Mash.new JSON.parse(data)
      data.extend Hashie::Extensions::DeepFind
    end
  end
end
