class BabysittersController < ApplicationController
  before_action :babysitter_find, only: [:edit, :show]
  before_action :move_to_show, only: [:new]
  before_action :move_to_new, only: [:show]

  def new
    @babysitter = Babysitter.new
    @babysitter.babysitter_images.new
  end

  def create
    @babysitter = Babysitter.new(babysitter_params)
    if @babysitter.save
      redirect_to babysitter_path(current_user.id), notice: "登録しました。"
    else
      flash[:error_messages] = @babysitter.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @babysitter = Babysitter.find(params[:id])
    if @babysitter.update(babysitter_params)
      redirect_to babysitter_path, notice: "変更しました。"
    else
      flash[:error_messages] = @babysitter.errors.full_messages
      render :edit
    end
  end

  def show
  end

  private

  def babysitter_params
    params.require(:babysitter).permit(:number_of_baby, :baby_age_range_top_year, :baby_age_range_top_month, :baby_age_range_down_year, :baby_age_range_down_month, :experience_year, :money_hour, :money_option, :profile_receiving_time_top, :profile_receiving_time_down, :profile_license, :introduction_title, :introduction_content, babysitter_images_attributes: [:name, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def babysitter_find
    @babysitter = Babysitter.find(params[:id])
  end

  def move_to_show
    redirect_to babysitter_path(current_user) if user_signed_in? && Babysitter.where(user_id: current_user.id).present?
  end

  def move_to_new
    redirect_to new_babysitter_path unless user_signed_in? && Babysitter.where(user_id: current_user.id).present?
  end

end
