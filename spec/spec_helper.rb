require 'pathname'
require 'bundler'
Bundler.setup
Bundler.require :test

require 'swing'

BASE_PATH = Pathname.new(__FILE__).dirname + '..'

RSpec.configure do |config|
   config.exclusion_filter = { :failing => true }
  # config.filter = { :focus => true }
  # config.include(UserExampleHelpers)
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
end
