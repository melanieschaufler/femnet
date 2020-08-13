class UserInterestsController < ApplicationController
  def index
    @user_interests = policy_scope(UserInterest.where(user: current_user))
    @user = current_user
    @interests = Interest.all
    @user_interest = UserInterest.new
  end

  def new
    @user_interest = UserInterest.new
    @interests = Interest.all
    @user = current_user
    authorize @user_interest
  end

  def create
      @user_interest = UserInterest.new(user_interest_params)
      @user = current_user
      @user_interest.user = @user

      authorize @user_interest

      @user_interest.save
      redirect_to user_path(current_user), notice: 'Interest was successfully created.'
  end

  def edit
    @user_interest = UserInterest.find(params[:id])
    @interests = Interest.all
    authorize @user_interest
  end

  def update
    @user_interest = UserInterest.find(params[:id])
    authorize @user_interest
    if @user_interest.update(user_interest_params)
      redirect_to user_path(current_user), notice: 'Interest was successfully updated.'
    else
      render "edit"
    end
  end

  def destroy
    @user_interest = UserInterest.find(params[:id])
    @user_interest.destroy
    authorize @user_interest
    redirect_to user_path(current_user)
  end

  private

  def user_interest_params
    params.require(:user_interest).permit(:score, :interest_id)
  end

end
