class ChatroomsController < ApplicationController

  def create
    @chatroom = Chatroom.new
    request = Request.find(params[:request_id])
    @chatroom.request = request
    @chatroom.name = "chatroom"
    authorize @chatroom
    if @chatroom.save
      redirect_to request_chatroom_path(request, @chatroom)
    else
      render "requests/my_requests"
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    # @chatroom = Chatroom.find_by(request: params[:request_id])
    authorize @chatroom
  end

end
