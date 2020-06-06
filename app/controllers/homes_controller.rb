class HomesController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).page(params[:page]).per(8)
  end

  def show
  end
end
