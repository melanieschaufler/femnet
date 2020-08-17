class DashboardController < ApplicationController
# skip_before_action :authenticate_user!
# before_action :authenticate_user!
  def index
    @user = current_user
    if current_user.mentor
      @my_requests = current_user.requests_as_receiver.where(status: "Accepted")
    else
      @my_requests = current_user.requests_as_asker.where(status: "Accepted")
    end
    @my_messages = @my_requests.map do |request|
      request.chatroom.messages.where.not(user: current_user).last
    end
  end
end
