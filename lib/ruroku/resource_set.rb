module Ruroku
  class ResourceSet < Array
    attr_accessor :api

    def initialize(api, *args)
      self.api = api

      super args
    end

    def self.map_api(methods)
      methods.each do |method_name, api_mapping|
        define_method method_name do |resource_name|
          api.send api_mapping, resource_name
        end
      end
    end
  end
end
