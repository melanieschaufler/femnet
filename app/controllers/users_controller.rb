class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    if current_user.mentor == false
      @users = policy_scope(User.where(mentor: true))
    else
      @users = policy_scope(User.where(mentor: false))
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    authorize @user
  end

  def edit
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

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'Your Profile was successfully deleted.'
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
    authorize @user
  end

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:name, :profession)
  end

end
