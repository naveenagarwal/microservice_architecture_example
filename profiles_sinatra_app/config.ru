require 'bundler'
Bundler.require

require "#{File.dirname(__FILE__)}/app"

run Rack::URLMap.new Profiles.routes
