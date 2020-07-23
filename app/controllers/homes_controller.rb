class HomesController < ApplicationController
  before_action :search_select, only: [:index, :search]

  def index
    if user_signed_in? && current_user.babysitter.present?
      @q = Babysitter.where.not(id: current_user.babysitter.id).ransack(params[:q])
    else
      @q = Babysitter.all.ransack(params[:q])
    end
    @babysitters = @q.result.includes(:user).page(params[:page]).per(8)
  end

  def show
    @babysitter = Babysitter.find(params[:id])
    @parent = Parent.find(params[:parent_id])
    @order = Order.new
  end

  def search
    if user_signed_in? && current_user.babysitter.present?
      @q = Babysitter.where.not(id: current_user.babysitter.id).search(search_params)
    else
      @q = Babysitter.all.search(search_params)
    end
    @babysitters = @q.result.includes(:user).page(params[:page]).per(8)
  end

  private

  def search_params
    params.require(:q).permit(:user_prefecture_eq)
  end

  def search_select
    @user = User.select(:prefecture).joins("left join babysitters on users.id = babysitters.user_id").where("babysitters.id is not null").distinct(:prefecture)
  end

end
