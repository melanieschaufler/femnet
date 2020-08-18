class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_requests, only: [:show, :destroy]

  def my_requests
    @my_requests = current_user.requests_as_receiver
    authorize @my_requests

    @user = current_user
    if current_user.mentor
      @my_requests = current_user.requests_as_receiver.where(status: "Accepted")
    else
      @my_requests = current_user.requests_as_asker.where(status: "Accepted")
    end
  end

  def show
    @request = current_user.request
    @request = Request.find(params[:request_id])
  end

  def create
    # find user to send request to
    @request = Request.new
    @request.asker = current_user
    receiver = User.find(params[:user_id])
    @request.receiver = receiver
    @request.status = "Pending"
    authorize @request
    if @request.save
      redirect_to dashboard_index_path(current_user), notice: 'Your request was successfull.'
    else
      redirect_to my_requests_requests_path(current_user), notice: 'Sorry, something went wrong.'
    end
  end

  def accept
    @request = Request.find(params[:id])
    authorize @request
    @request.status = "Accepted"
    @request.save
    @chatroom = Chatroom.create(request: @request)
    redirect_to my_requests_requests_path, notice: 'You are now mentor/mentee.'
  end

  def ignore
    @request = Request.find(params[:id])
    authorize @request
    @request.status = "Ignored"
    @request.save
    redirect_to my_requests_requests_path, notice: 'You ignored the request.'
  end

  # def my_mentors

  # end

  def destroy
    @request = Request.find(params[:id])
    authorize @request
    @request.destroy
    redirect_to mentors_path, notice: 'Your request was successfully cancelled.'
  end

  private

  def set_requests
    @request = Request.find(params[:id])
  end
end
