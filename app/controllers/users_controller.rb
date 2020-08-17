class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    if current_user.mentor == false
      if params[:query].present?
        sql_query = "name @@ :query OR city @@ :query OR profession @@ :query"
        @users = policy_scope(User.where(sql_query, query: "%#{params[:query]}%")).reject { |user| user == current_user }.reject { |user| user.mentor == false}
      # if params[:query].present?
      # sql_query = " \
      #   users.name @@ :query \
      #   OR users.city @@ :query \
      #   OR users.profession @@ :query \
      #   OR interests.name @@ :query \
      #  "
      # @users = User.joins(:interest).where(sql_query, query: "%#{params[:query]}%")
      else
        @users = policy_scope(User.where(mentor: true))
      end
    else
      @users = policy_scope(User.where(mentor: false))
    end
    @request = Request.new
  end

  def show
    @user = User.find_by_id(params[:id])
    @user_interests = UserInterest.all
    authorize @user
    @request = Request.new
    @status = current_user.requests_as_asker.find_by(receiver: @user)

    # 1 find all requests of current user

    # 2 within all requests find request where @user exist as receiver
    # if exist = show status for request
    # else
    #  redirect_to my_requests_requests_path
    # end
  end

  def edit
  end

  def update
    @user = current_user
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      # bypass_sign_in(@user)
      redirect_to user_path(@user)
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
    params.require(:user).permit(:name, :profession, :age, :photo, :city, :answer1, :answer2, :answer3, :resume)
  end

end
