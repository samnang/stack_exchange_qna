module StackExchangeQnA
  module ResponseStats
    attr_writer :response
    def response; @response ||= {}; end

    def total; response["total"]; end
    def page; response["page"]; end
    def pagesize; response["pagesize"]; end
  end
end
