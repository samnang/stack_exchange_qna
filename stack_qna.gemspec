# -*- encoding: utf-8 -*-
require File.expand_path('../lib/stack_qna/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Samnang Chhun"]
  gem.email         = ["samnang.chhun@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "stack_qna"
  gem.require_paths = ["lib"]
  gem.version       = StackQnA::VERSION

  gem.add_development_dependency "rspec", "~> 2.7"
  gem.add_development_dependency "guard-rspec", "~> 0.5"
end
