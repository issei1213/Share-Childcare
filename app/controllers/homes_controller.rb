class HomesController < ApplicationController
  def index
    # @users = User.all
    @users = User.page(params[:page]).per(2)

  end
end
