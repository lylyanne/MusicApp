class UsersController < ApplicationController
  before_action :require_no_login_user!, only: [:create, :new]
  
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render text: @user.email
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
