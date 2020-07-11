class OrdersController < ApplicationController
  before_action :order_set_find, only: [:show, :edit, :update, :destroy, :approve, :cancel]


  def root
    @user = User.new
  end

  def index
    @order = Order.all
  end

  def create
    @order = Parent.find(params[:order][:parent_id]).orders.new(order_params.merge(status: "orderd"))
    if @order.save
      @order.notification_order!("ordered", current_user)
      redirect_to notifications_path, notice: "依頼しました。ベビーシッターから連絡があるまで暫くお待ちください。"
    else
      flash[:error_messages] = @order.errors.full_messages
      redirect_to home_path(id: current_user ,user_id: user.babysitter.id, parent_id: current_user.parent.id)
    end
  end

  def show
    @order.update_notification_checked!(@order.notifications)
  end

  def edit
    @babysitter = Babysitter.find(params[:babysitter_id])
    @parent = Parent.find(params[:parent_id])
  end

  def update
    @order.update(order_params)
    @order.notification_order!("ordered-updated", current_user)
    redirect_to notifications_path, notice: "変更しました。ベビーシッターから連絡があるまで暫くお待ちください。"
  end

  def destroy
    @order.destroy
    redirect_to notifications_path, notice: "削除しました。"
  end

  def approve
    if @order.status == "ordered"
      @order.update(status: "approved")
      @order.notification_order!("ordered-approved", current_user)
      redirect_to notifications_path, notice: "依頼を承諾しました。チャットルームを開放します。"
    else
      flash[:error] = "この依頼は回答済みです。"
      redirect_to notifications_path
    end
  end

  def cancel
    if @order.status == "ordered"
      @order.update(status: "canceled")
      @order.notification_order!("ordered-canceled", current_user)
      redirect_to notifications_path, notice: "依頼をキャンセルしました。"
    else
      flash[:error] = "この依頼は回答済みです。"
      redirect_to notifications_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:year, :month, :date, :hour_top, :hour_down, :money_hour, :money_option, :memo, :page, :babysitter_id, :parent_id).merge(user_id: current_user.id)
  end

  def order_set_find
    @order = Order.find(params[:id])
  end

end