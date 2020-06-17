class HomesController < ApplicationController
  def index
    if user_signed_in?
      @users = User.where.not(id: current_user.id).page(params[:page]).per(8)
    end
  end

  def show
    @babysitter = Babysitter.find(params[:babysitter_id])
    @parent = Parent.find(params[:parent_id])
    @order = Order.new
  end
end
