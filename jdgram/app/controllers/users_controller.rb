class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate
      session[:user_id] = user.id
      redirect_to user_path
    else
      redirect '/'
    end
  end

  def edit
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
