class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]

  def index

    @interests = Interest.all

    if current_user.mentor == false
      if params[:professions].present? || params[:query].present? || params[:interests].present?
        #raise
        # first filter by search
        @users = policy_scope(User.where(mentor: true).geocoded)
        sql_query = "name ILIKE :query OR city ILIKE :query "
        @users = policy_scope(User.where(sql_query, query: "%#{params[:query]}%")).filter_by_mentor(current_user) if params[:query].present?

        # second filter by filter selection
        @users = @users.filter_by_profession(params[:professions]) if params[:professions].present?

        @users = @users.filter_by_interest(params[:interests].map { |id| id.to_i }) if params[:interests].present?

      else
        @users = policy_scope(User.where(mentor: true).geocoded)
      end
    else
      @users = policy_scope(User.where(mentor: false).geocoded)
    end
    @request = Request.new

    prng = Random.new

    @markers = @users.map do |user|
        {
          lat: user.latitude - prng.rand(0.001..0.02),
          lng: user.longitude - prng.rand(0.0001..0.02),
          infoWindow: render_to_string(partial: "info_window", locals: { user: user })
        }
    end

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
