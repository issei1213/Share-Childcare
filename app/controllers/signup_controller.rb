class SignupController < ApplicationController
  def step1
    @signup = User.new
  end

  def step2
    @signup = User.new
  end

  def check
    @signup = User.new
  end

  def done
    @signup = User.new
  end

  private

  def user_params
    params.require(:user).permit(
      # :nickname, 
      # :email, 
      # :password, 
      # :password_confirmation, 
      # :last_name, 
      # :first_name, 
      # :last_name_kana, 
      # :first_name_kana
  )
  end
end
