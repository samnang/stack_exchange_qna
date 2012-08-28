class StackExchangeQnA::Request
  def self.get(end_point, options={})
    client = StackExchangeQnA.client
    options.merge!(:key => client.api_key)

    HTTParty.get("http://#{client.site}/#{StackExchangeQnA::Client::API_VERSION}/#{end_point}", :query => options)
  end
end
