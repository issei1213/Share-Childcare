class OrdersController < ApplicationController

  def root
    @user = User.new
  end

  def index
    @order = Order.all
  end

  def create
    @order = Order.new(order_params)
    if @order_params
      redirect_to root_path
    else
      flash[:error_messages] = @order.errors.full_messages
      render :new
  end

  private

  def order_params
    params.require(:order).permit(:)
  end
end
