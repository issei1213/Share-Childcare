class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(["visitor_id = ? or visited_id = ?", current_user.id, current_user.id]).page(params[:page]).per(15)
  end
end
