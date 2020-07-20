class HomesController < ApplicationController
  def index
    if user_signed_in? && current_user.babysitter.present?
      @babysitters = Babysitter.where.not(id: current_user.babysitter.id).page(params[:page]).per(8)
    end
  end

  def show
    @babysitter = Babysitter.find(params[:id])
    @parent = Parent.find(params[:parent_id])
    @order = Order.new
  end
end
