class Profiles::UsersController < Profiles::ApplicationController

  get "/" do
    @users = Profiles::User.all.to_a # TODO - Add pagination
    rabl :"users/index"
  end

  get "/:id" do
    @user = Profiles::User.find params[:id]
    rabl :"users/show"
  end

  post "/" do
    @user = Profiles::User.new params[:user]
    @user.save
    rabl :"users/create"
  end

  put "/:id" do
    @user = Profiles::User.find params[:id]
    @user.update_attributes params[:user]
    rabl :"users/update"
  end

  delete "/:id" do
    @user = Profiles::User.find params[:id]
    @user.destroy
    rabl :"users/destroy"
  end

end
