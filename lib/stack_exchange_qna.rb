require 'httparty'
require 'hashie'
require 'active_support/inflector'

require "stack_exchange_qna/version"
require "stack_exchange_qna/client"
require "stack_exchange_qna/query_methods"
require "stack_exchange_qna/response_stats"
require "stack_exchange_qna/base"
require "stack_exchange_qna/question"
require "stack_exchange_qna/answer"

module StackExchangeQnA
  class << self
    attr_reader :client

    def configure
      @client = Client.new
      yield(@client)

      @client
    end
  end
end
