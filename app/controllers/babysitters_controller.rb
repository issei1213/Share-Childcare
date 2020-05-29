class BabysittersController < ApplicationController
  def new
    @babysitter = Babysitter.new
    @babysitter.babysitter_images.new
  end

  def create
    @babysitter = Babysitter.new(babysitter_params)
    if @babysitter.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @babysitter = current_user.babysitter
    @babysitter.babysitter_images
  end

  def update
    @babysitter = current_user.babysitter
    @babysitter.update!(babysitter_params)
    redirect_to babysitter_path, notice: "変更しました。"
  end

  def show
    @babysitter = current_user.babysitter
  end

  private

  def babysitter_params
    params.require(:babysitter).permit(:baby_age_range_top_year, :baby_age_range_top_month, :baby_age_range_down_year, :baby_age_range_down_month, :experience_year, :money_hour, :money_option, :profile_receiving_time_top, :profile_receiving_time_down, :profile_license, :introduction_title, :introduction_content, babysitter_images_attributes: [:name]).merge(user_id: current_user.id)
  end
end
