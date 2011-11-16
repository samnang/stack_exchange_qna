class StackExchangeQnA::QueryMethods
  include Enumerable

  attr_reader :query_options

  def initialize(model, query_options={})
    @model = model
    @query_options = query_options
  end

  def where(hash)
    @query_options.merge!(hash)
    self
  end

  def pagesize(number=nil)
    return collection.pagesize if number.nil?

    @query_options[:pagesize] = number
    self
  end

  def page(number=nil)
    return collection.page if number.nil?

    @query_options[:page] = number
    self
  end

  def includes(*args)
    @query_options.merge!(Hash[args.flatten.map{ |a| [a, true] }])
    self
  end

  def order(option)
    @query_options[:sort] = option
    @query_options[:sort], @query_options[:order] = option.first if option.is_a? Hash

    self
  end

  def total
    collection.total
  end

  def each
    collection.each{ |resource| yield resource }
  end

  private

  def collection
    @collection ||= @model.all(@query_options)
  end
end
