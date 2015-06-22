class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.to_a
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.valid? && @user.save
      redirect_to user_path(@user.id), notice: "User created successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.assign_attributes params[:user]
    if @user.valid? && @user.save
      redirect_to user_path(@user.id), notice: "User updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User destroyed successfully"
  end

  private

  def find_user
    @user = User.find params[:id]
  end
end
