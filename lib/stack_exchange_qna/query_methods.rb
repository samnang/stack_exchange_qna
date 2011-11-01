class StackExchangeQnA::QueryMethods
  include Enumerable

  def initialize(model, options={})
    @model = model
    @options = options
  end

  def where(hash)
    @options[:where] = hash
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
    @options[:includes] = args.flatten
    self
  end

  def query_string
    params = []

    @options[:where].each do |param, value|
      params << "#{param}=#{value}"
    end

    @options.each do |param, value|
      next if [:includes, :where].include?(param)

      params << "#{param}=#{value}"
    end

    @options[:includes].each do |association|
      params << "#{association}=true"
    end

    params.join("&")
  end

  def total
    @options[:total]
  end

  def each(&block)
    @options[:collection].each{ |resource| block.call(resource) }
  end
end
