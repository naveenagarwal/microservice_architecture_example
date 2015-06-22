require 'spec_helper'

describe Profiles::UsersController do

  def app
    Profiles::UsersController
  end

  it "should list all the users" do
    expect {
      get "/"
      last_response.should be_ok
    }
  end

  it "should create a record" do
    user_params = {
      user: {
        name: "test",
        email: "test@user.com"
      }
    }

    post "/", user_params
    body = JSON.parse last_response.body

    expect(body["error"]).to eq(nil)
    expect(body["name"]).to eq("test")
  end

  it "should show a record" do
    user = Profiles::User.create(name: "test", email: "test@user")

    get "/#{user.id}"
    body = JSON.parse last_response.body

    expect(body["error"]).to eq(nil)
    expect(body["id"]).to eq(user.id.to_s)
  end

  it "should update a record" do
    user = Profiles::User.create(name: "test", email: "test@user")
    updated_name = "updated_name"
    user_params = {
      user: {
        name: updated_name
      }
    }
    put "/#{user.id}", user_params
    body = JSON.parse last_response.body

    expect(body["error"]).to eq(nil)
    expect(body["name"]).to eq(updated_name)
  end

  it "should delete a record" do
    user = Profiles::User.create(name: "test", email: "test@user")

    delete "/#{user.id}"
    body = JSON.parse last_response.body

    expect(body["error"]).to eq(nil)
    expect(body["success"]).to eq("User record destroyed successfully")
  end

end
