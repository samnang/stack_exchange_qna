class StackQnA::Client
  attr_reader :api_key, :site

  def initialize(args)
    @api_key = args[:api_key]
    @site = args[:site]
  end
end
