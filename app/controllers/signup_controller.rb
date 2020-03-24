class SignupController < ApplicationController
  def step1
    @signup = User.new
  end

  def step2
    session[:first_name] = user_params[:first_name],
    session[:last_name] = user_params[:last_name],
    session[:first_name_kana] = user_params[:first_name_kana],
    session[:last_name_kana] = user_params[:last_name_kana],
    session[:nickname] = user_params[:nickname],
    session[:email] = user_params[:email],
    session[:phone_number] = user_params[:phone_number],
    session[:password] = user_params[:password],
    session[:password_confirmation] = user_params[:password_confirmation]
    @signup = User.new
  end

  def check
    session[:postcode] = user_params[:postcode],
    session[:prefecture] = user_params[:prefecture],
    session[:city] = user_params[:city],
    session[:block] = user_params[:block],
    session[:building] = user_params[:building]
    @signup = User.new
  end

  def done
    @signup = User.new
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :nickname,
      :postcode,
      :prefecture,
      :city,
      :block,
      :building,
      :email,
      :phone_number,
      :password,
      :password_confirmation
  )
  end
end
