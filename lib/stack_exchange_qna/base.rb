class StackExchangeQnA::Base < Hashie::Mash
  class << self
    def all
      response = make_request(resource_url)
      collection = parse_response_collection(response)

      StackExchangeQnA::QueryMethods.new(self, :collection => collection,
                                               :total => response["total"],
                                               :page => response["page"],
                                               :pagesize => response["pagesize"])
    end

    def find(id)
      response = make_request(resource_url(id))

      parse_response_collection(response).first
    end

    def self.where(hash)
      QueryMethods.new(self).where(hash)
    end

    def self.pagesize(number)
      QueryMethods.new(self).pagesize(number)
    end

    def self.page(number)
      QueryMethods.new(self).page(number)
    end

    def self.includes(*args)
      QueryMethods.new(self).includes(*args)
    end

    private

    def make_request(url)
      HTTParty.get(url)
    end

    def resource_url(id=nil)
      client = StackExchangeQnA.client

      "http://#{client.site}/#{StackExchangeQnA::Client::API_VERSION}/#{resource_name}/#{id}"
    end

    def resource_name
      "#{self.name.split("::").last.downcase}s"
    end

    def parse_response_collection(response)
      response[resource_name].map{ |r| self.new(r) }
    end
  end
end
