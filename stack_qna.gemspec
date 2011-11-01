# -*- encoding: utf-8 -*-
require File.expand_path('../lib/stack_exchange_qna/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Samnang Chhun"]
  gem.email         = ["samnang.chhun@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "stack_exchange_qna"
  gem.require_paths = ["lib"]
  gem.version       = StackExchangeQnA::VERSION

  gem.add_dependency "httparty", "~> 0.8.1"
  gem.add_dependency "hashie", "~> 1.2.0"

  gem.add_development_dependency "rspec", "~> 2.7"
  gem.add_development_dependency "guard-rspec", "~> 0.5"
  gem.add_development_dependency "pry", "~> 0.9.7"
end
