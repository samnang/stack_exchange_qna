class StackExchangeQnA::QueryMethods
  attr_reader :query_options

  def initialize(model, query_options={})
    @model = model
    @query_options = query_options
  end

  def where(arg)
    new_query(arg)
  end

  def total
    collection.total
  end

  def pagesize(number=nil)
    return collection.pagesize if number.nil?

    new_query(:pagesize => number)
  end

  def page(number=nil)
    return collection.page if number.nil?

    new_query(:page => number)
  end

  def includes(*args)
    new_query(Hash[args.flatten.map{ |a| [a, true] }])
  end

  def order(option)
    option.is_a?(Hash) ? new_query(Hash[[:sort, :order].zip(option.first)]) : new_query(:sort => option)
  end

  def method_missing(sym, *args, &block)
    return collection.send(sym, *args, &block) if collection.respond_to?(sym)

    super
  end

  private

  def new_query(option)
    self.class.new(@model, @query_options.merge(option))
  end

  def collection
    @collection ||= @model.all(@query_options)
  end
end
