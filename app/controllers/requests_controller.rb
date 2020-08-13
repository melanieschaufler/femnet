class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_requests, only: [:show, :destroy]

  def my_requests
    @my_requests = current_user.requests_as_receiver
    authorize @my_requests
  end

  def show
    @request = current_user.request
    @request = Request.find(params[:request_id])
  end

  def create
    #find user to send request to
    @request = Request.new
    @request.asker = current_user
    receiver = User.find(params[:user_id])
    @request.receiver = receiver
    @request.status = "Pending"
    authorize @request
    if @request.save
      redirect_to user_path(receiver), notice: 'Your request was successfull.'
    else
      render :new
    end
  end

  def accept
    @request = Request.find(params[:id])
    authorize @request
    @request.status = "Accepted"
    @request.save
    redirect_to my_requests_requests_path, notice: 'You are now mentor/mentee'
  end

  def ignore
    @request = Request.find(params[:id])
    authorize @request
    @request.status = "Ignored"
    @request.save
    redirect_to my_requests_requests_path, notice: 'You ignored the request'
  end

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
