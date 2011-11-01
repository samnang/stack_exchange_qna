module StackExchangeQnA
  class Question < Base
    def self.where(hash)
      QueryMethods.new(self).where(hash)
    end

    def self.pagesize(number)
      QueryMethods.new(self).pagesize(number)
    end

    def self.page(number)
      QueryMethods.new(self).page(number)
    end

    def self.includes(*args)
      QueryMethods.new(self).includes(*args)
    end
  end
end
