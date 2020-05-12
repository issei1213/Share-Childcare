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

  def update
  end

  private

  def babysitter_params
    params.require(:babysitter).permit(:baby_age_range_top_year, :baby_age_range_top_month, :baby_age_range_down_year, :baby_age_range_down_month, babysitter_images_attributes: [:name]).merge(user_id: current_user.id)
  end
end
