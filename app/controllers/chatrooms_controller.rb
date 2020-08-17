class ChatroomsController < ApplicationController

  def create
    @chatroom = Chatroom.new
    @request = Request.find(params[:request_id])
    @chatroom.request = request
    # @chatroom.name = receiver.name
    authorize @chatroom
    if @chatroom.save
      redirect_to request_chatroom_path(request, @chatroom)
    else
      render "requests/my_requests"
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @receiver = User.find(@chatroom.request.receiver_id)
    @asker = User.find(@chatroom.request.asker_id)

    if current_user.mentor
      @chatroom.name = @asker.name
    else
      @chatroom.name = @receiver.name
    end

    @message = Message.new
    # @chatroom = Chatroom.find_by(request: params[:request_id])
    authorize @chatroom
  end
end
