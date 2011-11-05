# -*- encoding: utf-8 -*-
require File.expand_path('../lib/stack_exchange_qna/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Samnang Chhun"]
  gem.email         = ["samnang.chhun@gmail.com"]
  gem.description   = %q{Stack Exchange Question and Answers API wrapper client. It helps you to simplify querying data from stack exchange sites(stackoverflow.com, superuser.com, etc.) via object oriented way.}
  gem.summary       = %q{Stack Exchange Question and Answers API wrapper client}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "stack_exchange_qna"
  gem.require_paths = ["lib"]
  gem.version       = StackExchangeQnA::VERSION

  gem.add_dependency "httparty", "~> 0.8.1"
  gem.add_dependency "hashie", "~> 1.2.0"
  gem.add_dependency "activesupport", "~> 3.0.0"
  gem.add_dependency "i18n"

  gem.add_development_dependency "rspec", "~> 2.7"
  gem.add_development_dependency "guard-rspec", "~> 0.5"
  gem.add_development_dependency "pry", "~> 0.9.7"
end
