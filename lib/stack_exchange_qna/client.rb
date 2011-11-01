module StackExchangeQnA
  class Client
    API_VERSION = "1.1"

    attr_accessor :api_key, :site

    def initialize(args={})
      @api_key = args[:api_key]
      @site = args[:site]
    end
  end
end
