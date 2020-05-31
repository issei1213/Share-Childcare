class BabysittersController < ApplicationController
  before_action :babysitter_find, only: [:edit, :update, :show]

  def new
    @babysitter = Babysitter.new
    @babysitter.babysitter_images.new
  end

  def create
    @babysitter = Babysitter.new(babysitter_params)
    if @babysitter.save
      redirect_to babysitter_path(current_user.id), notice: "登録しました。"
    else
      render :new
    end
  end

  def edit
    @babysitter.babysitter_images
  end

  def update
    if @babysitter.update(babysitter_params)
      redirect_to babysitter_path, notice: "変更しました。"
    else
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
    @babysitter = current_user.babysitter
  end
end
