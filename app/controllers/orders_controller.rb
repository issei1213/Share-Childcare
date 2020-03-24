class OrdersController < ApplicationController

  def root
    @user = User.new
  end

  def index
    @order = Order.all
  end
end
