require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :fakeweb
  c.default_cassette_options = { :record => :once }
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
  c.around(:each, :vcr) do |example|
    name = example.metadata[:vcr]
    VCR.use_cassette(name) { example.call } 
  end
end
