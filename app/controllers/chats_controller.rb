class ChatsController < ApplicationController
  def index
    @order = Order.find(params[:order_id])
    @chats = @order.chats.includes(:user)
    @chat = @order.chats.new
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
      redirect_to order_chats_path(@order)
    end
  end

  def list
    if current_user.parent.present? && current_user.babysitter.present?
      @orders = Order.where(["(parent_id = ? or babysitter_id = ?) and status = ?", current_user.parent.id, current_user.babysitter.id, 2]).includes([chats: :user, babysitter: :user, parent: :user]).page(params[:page]).per(15)
    elsif current_user.parent.present?
      @orders = Order.where(["parent_id = ? and status = ?", current_user.parent.id, 2]).includes([chats: :user, babysitter: :user, parent: :user]).page(params[:page]).per(15)
    elsif current_user.babysitter.present?
      @orders = Order.where(["babysitter_id = ? and status = ?", current_user.babysitter.id, 2]).includes([chats: :user, babysitter: :user, parent: :user]).page(params[:page]).per(15)
    else
      @orders = Order.where(["created_at = ?", "2000-00-00 00:00:00"]).includes([chats: :user, babysitter: :user, parent: :user]).page(params[:page]).per(15)
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:comment).merge(user_id: current_user.id)
  end

end
