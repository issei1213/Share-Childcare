class ChatsController < ApplicationController
  def index
    @order = Order.find(params[:order_id])
    @chats = @order.chats.includes(:user)
    @chat = @order.chats.new
    # @order.save_notification_checked!(current_user)
    @order.save_notification_checked!(current_user)
  end

  def create
    @order = Order.find(params[:order_id])
    @chat = @order.chats.new(chat_params)
    if @chat.save
      respond_to do |format|
        format.html { redirect_to order_chats_path(@order), notice: 'メッセージが送信されました'  }
        format.json
      end
      @chat.create_notification_chat!(current_user, @chat.id)
    else
      flash[:error_messages] = @comment.errors.full_messages
      render index
    end
  end

  def list
    @orders = Order.where(["(parent_id = ? or babysitter_id = ?) and status = ?", current_user.parent.id, current_user.babysitter.id, 2])
  end

  private
  def chat_params
    params.require(:chat).permit(:comment).merge(user_id: current_user.id)
  end

  # def save_notification_checked(current_user, chats)
  #   chats.each do |chat|
  #     notification = Notification.where("visitor_id = ? and chat_id = ? and action = ? ", current_user.id, chat.id, "commented")
  #     if notification.visitor_id == notification.visited_id
  #       notification.checked = true
  #     end
  #   end
  # end
end
