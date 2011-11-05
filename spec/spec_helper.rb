require 'rspec'
require 'pry'

require File.join(File.dirname(__FILE__), '../lib/stack_exchange_qna')
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each{ |f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.color_enabled = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end
