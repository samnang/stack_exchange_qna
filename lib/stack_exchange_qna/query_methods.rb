class StackExchangeQnA::QueryMethods
  include Enumerable

  def initialize(model, options={})
    @model = model
    @options = options
  end

  def where(hash)
    @options.merge!(hash)
    self
  end

  def pagesize(number)
    @options[:pagesize] = number
    self
  end

  def page(number)
    @options[:page] = number
    self
  end

  def includes(*args)
    @options.merge!(Hash[args.flatten.map{ |a| [a, true] }])
    self
  end

  def query_string
    @options.map{ |param, value| "#{param}=#{value}" }.join("&")
  end

  def total
    @options[:total]
  end

  def each(&block)
    @options[:collection].each{ |resource| block.call(resource) }
  end
end
