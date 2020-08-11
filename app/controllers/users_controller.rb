class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.mentor == false
      @users = User.where(mentor: true)
    else
      @users = User.where(mentor: false)
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      # bypass_sign_in(@user)
      # redirect_to show_user_path
    else
      render "edit"
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:name, :profession)
  end

end
