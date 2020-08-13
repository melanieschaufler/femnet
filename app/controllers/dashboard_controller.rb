class DashboardController < ApplicationController
# skip_before_action :authenticate_user!
# before_action :authenticate_user!

  def index
    @user = current_user
    @my_requests = current_user.requests_as_receiver
  end

end
