class ChatsController < ApplicationController
  def index
    @order = Order.find(params[:order_id])
    @chats = @order.chats.includes(:user)
    @chat = @order.chats.new
  end

  def create
    @order = Order.find(params[:order_id])
    @chat = @order.chats.new(chat_params)
    if @chat.save
      respond_to do |format|
        format.html { redirect_to order_chats_path(@order), notice: 'メッセージが送信されました'  }
        format.json
      end
    else
      flash[:error_messages] = @comment.errors.full_messages
      render index
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:comment).merge(user_id: current_user.id)
  end

end
