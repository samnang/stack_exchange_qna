module StackExchangeQnA
  class Base < Hashie::Mash

    class << self
      def all(args={})
        response = make_request("#{resource_url}?#{query_string(args)}")
        collection = parse_response_collection(response)

        QueryMethods.new(self, :collection => collection,
                               :total => response["total"],
                               :page => response["page"],
                               :pagesize => response["pagesize"])
      end

      def find(id)
        response = make_request(resource_url(id))

        parse_response_collection(response).first
      end

      def where(hash)
        QueryMethods.new(self).where(hash)
      end

      def pagesize(number)
        QueryMethods.new(self).pagesize(number)
      end

      def page(number)
        QueryMethods.new(self).page(number)
      end

      def includes(*args)
        QueryMethods.new(self).includes(*args)
      end

      def order(option)
        QueryMethods.new(self).order(option)
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

      def query_string(params)
        params.map{ |param, value| "#{param}=#{value}" }.join("&")
      end

      def parse_response_collection(response)
        response[resource_name].map{ |r| self.new(r) }
      end
    end
  end
end
