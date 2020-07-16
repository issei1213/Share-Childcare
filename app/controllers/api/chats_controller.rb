class Api::ChatsController < ApplicationController
  def index
    order = Order.find(params[:order_id])
    last_comment_id = params[:id].to_i
    @chats = order.chats.includes(:user).where("id > ?", last_comment_id)
  end
end