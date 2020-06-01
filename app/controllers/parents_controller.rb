class ParentsController < ApplicationController
  before_action :parent_find, only: [:edit, :update, :show]

  def new
    @parent = Parent.new
    @parent.baby_infomations.build
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save!
      redirect_to parent_path(current_user.id), notice: "登録しました。"
    else
      flash[:error_messages] = @parent.errors.full_messages
      render :new
    end
  end

  def edit
    @parent.baby_infomations
  end

  def update
    if @parent.update(parent_params)
      redirect_to parent_path(current_user.id), notice: "変更しました。"
    else
      flash[:error_messages] = @parent.errors.full_messages
      render :edit
    end
  end

  def show
  end

  private

  def parent_params
    params.require(:parent).permit(:order_money_hour, :order_money_option, :order_memo, :order_prefecture, :order_city, baby_infomations_attributes: [:id, :age, :name, :sex, :done, :_destroy]).merge(user_id: current_user.id)
  end

  def parent_find
    @parent = current_user.parent
  end
end
