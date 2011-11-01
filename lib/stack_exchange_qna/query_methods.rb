class StackExchangeQnA::QueryMethods
  include Enumerable

  def initialize(model, options={})
    @options = Hash.new
    @model = model
    @options = options
  end

  def total
    @options[:total]
  end

  def each(&block)
    @options[:collection].each{ |resource| block.call(resource) }
  end
end
