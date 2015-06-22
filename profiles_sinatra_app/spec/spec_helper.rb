# -*- encoding : utf-8 -*-
require 'bundler'
Bundler.require :default, :test

# setup test environment
Sinatra::Base.set :environment, :test
ENV['RACK_ENV'] ||= 'test'

require 'sinatra'
require 'sinatra/contrib'

require File.join(File.dirname(__FILE__), '..', 'app')


FactoryGirl.definition_file_paths = [File.join(File.dirname(__FILE__), 'factories')]
FactoryGirl.find_definitions


RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.order = 'random'
  config.include Sinatra::TestHelpers

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end
end
