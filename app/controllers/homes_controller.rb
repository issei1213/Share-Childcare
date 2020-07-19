class HomesController < ApplicationController
  def index
    if user_signed_in?
      @babysitters = Babysitter.where.not(id: current_user.babysitter.id).page(params[:page]).per(8)
    end
  end

  def show
    @babysitter = Babysitter.find(params[:babysitter_id])
    @parent = Parent.find(params[:parent_id])
    @order = Order.new
  end
end
