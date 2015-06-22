class Profiles::ApplicationController < Sinatra::Base

  set :views, File.join(File.dirname(__FILE__), "..", "views")

  set :rabl, content_type: :json
  set :logging, true

  get "/" do
    "Yeah! We set up our first service. Welcome to Profiles!!!"
  end

  delete "/purge_database" do
    Mongoid::Config.purge!
  end

end
