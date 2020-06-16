class OrdersController < ApplicationController

  def root
    @user = User.new
  end

  def index
    @order = Order.all
  end

  def create
    @order = Parent.find(params[:order][:parent_id]).orders.new(order_params.merge(status: "orderd"))
    if @order.save
      redirect_to root_path, notice: "依頼しました。ベビーシッターから連絡があるまで暫くお待ちください。"
    else
      flash[:error_messages] = @order.errors.full_messages
      redirect_to home_path(id: current_user ,user_id: user.babysitter.id, parent_id: current_user.parent.id)
    end
  end

  private

  def order_params
    params.require(:order).permit(:year, :month, :date, :hour_top, :hour_down, :money_hour, :money_option, :memo, :babysitter_id, :page, :parent_id).merge(user_id: current_user.id)
  end


end