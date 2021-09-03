class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy favorite relationship]
  skip_before_action :login_required, only: [:new, :create]
  before_action :already_logged_in, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @following = @user.following
    @followers = @user.followers
  end

  def new
    @user = User.new
  end
  def favorite
    
  end

  def relationship
    @following = @user.following
    @followers = @user.followers
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Your account was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Your account was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path, notice: "Your account was successfully destroyed."
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_name, :image_name_cache)
  end
end