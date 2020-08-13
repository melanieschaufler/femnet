class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom
    authorize @message
    if @message.save!
      redirect_to request_chatroom_path(@chatroom.request, @chatroom)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user: current_user)
  end
end
