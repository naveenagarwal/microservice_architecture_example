$: << 'app'

Rabl.configure do |config|
  config.include_json_root = false
  config.include_child_root = false
end

Rabl.register!

Mongoid.load!("#{File.dirname(__FILE__)}/config/mongoid.yml")

module Profiles

  Dir[File.join(File.dirname(__FILE__), 'app', '*.rb')].each do |f|
    autoload File.basename(f, '.rb').camelize.to_sym, f
  end

  Dir[File.join(File.dirname(__FILE__), 'app', 'models/**/*.rb')].each do |filename|
    autoload File.basename(filename, '.rb').camelize.to_sym, filename
  end

  Dir[File.join(File.dirname(__FILE__), 'app', 'controllers/**/*.rb')].each do |filename|
    autoload File.basename(filename, '.rb').camelize.to_sym, filename
  end

  def self.routes
    {
      "/" => Profiles::ApplicationController,
      "/users" => Profiles::UsersController
    }
  end

end
