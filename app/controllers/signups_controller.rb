class SignupsController < ApplicationController
  before_action :move_to_root, except: [:mypage, :edit, :update]
  before_action :create_user_new, only: [:step1, :step1_validates, :step2, :step2_validates]

  def index
    @user = User.all
  end

  def step1
  end

  def step1_validates
    @user_step1 = step1_params(user_params)
    @user_step1.valid?
    skip_step1_validates(@user_step1.errors)
    if @user_step1.errors.messages.blank? && @user_step1.errors.details.blank?
      step1_session(user_params)
      redirect_to step2_signups_path
    else
      flash[:alert] = @user_step1
      flash[:error_messages] = @user_step1.errors.full_messages
      @user = User.new(user_params)
      render "step1"
    end
  end

  def step2
  end

  def step2_validates
    @user_step2 = step2_params(user_params)
    @user_step2.valid?
    skip_step2_validates(@user_step2.errors)
    if @user_step2.errors.messages.blank? && @user_step2.errors.details.blank?
      step2_session(user_params)
      redirect_to new_signup_path
    else
      flash[:alert] = @user_step2.errors.messages
      @user = User.new(user_params)
      render "step2" and return
    end
  end

  def new
    @user = User.new(first_name: session[:first_name], last_name: session[:last_name], first_name_kana: session[:first_name_kana], last_name_kana: session[:last_name_kana], nickname: session[:nickname], email: session[:email], phone_number: session[:phone_number], password: session[:password], password_confirmation: session[:password_confirmation], postcode: session[:postcode], prefecture: session[:prefecture], city: session[:city], block: session[:block], building: session[:building])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in User.find(@user.id) unless user_signed_in?
      delete_session
    else
      render :new
    end
  end

  def mypage
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      sign_in(user, bypass: true)
    else
      flash[:error_messages] = @user.errors.full_messages
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :postcode, :prefecture, :city, :block, :building, :email, :phone_number, :password, :password_confirmation)
    end

    def step1_params(user_params)
      User.new(
        first_name: user_params[:first_name],
        last_name: user_params[:last_name],
        first_name_kana: user_params[:first_name_kana],
        last_name_kana: user_params[:last_name_kana],
        nickname: user_params[:nickname],
        email: user_params[:email],
        phone_number: user_params[:phone_number],
        password: user_params[:password],
        password_confirmation: user_params[:password_confirmation]
      )
    end

    def skip_step1_validates(errors)
      errors.messages.delete(:postcode)
      errors.messages.delete(:prefecture)
      errors.messages.delete(:city)
      errors.messages.delete(:block)
      errors.messages.delete(:building)
      errors.details.delete(:postcode)
      errors.details.delete(:prefecture)
      errors.details.delete(:city)
      errors.details.delete(:block)
      errors.details.delete(:building)
    end

    def step1_session(user_params)
      session[:first_name] = user_params[:first_name]
      session[:last_name] = user_params[:last_name]
      session[:first_name_kana] = user_params[:first_name_kana]
      session[:last_name_kana] = user_params[:last_name_kana]
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:phone_number] = user_params[:phone_number]
      session[:password] = user_params[:password]
      session[:password_confirmation] = user_params[:password_confirmation]
    end


    def step2_params(user_params)
      User.new(postcode: user_params[:postcode], prefecture: user_params[:prefecture], city: user_params[:city], block: user_params[:block], building: user_params[:building])
    end

    def skip_step2_validates(errors)
      errors.messages.delete(:first_name)
      errors.messages.delete(:last_name)
      errors.messages.delete(:first_name_kana)
      errors.messages.delete(:last_name_kana)
      errors.messages.delete(:nickname)
      errors.messages.delete(:email)
      errors.messages.delete(:phone_number)
      errors.messages.delete(:password)
      errors.messages.delete(:password_confirmation)
      errors.details.delete(:first_name)
      errors.details.delete(:last_name)
      errors.details.delete(:first_name_kana)
      errors.details.delete(:last_name_kana)
      errors.details.delete(:nickname)
      errors.details.delete(:email)
      errors.details.delete(:phone_number)
      errors.details.delete(:password)
      errors.details.delete(:password_confirmation)
    end

    def step2_session(user_params)
      session[:postcode] = user_params[:postcode]
      session[:prefecture] = user_params[:prefecture]
      session[:city] = user_params[:city]
      session[:block] = user_params[:block]
      session[:building] = user_params[:building]
    end

    def delete_session
      session.delete(:first_name)
      session.delete(:last_name)
      session.delete(:first_name_kana)
      session.delete(:last_name_kana)
      session.delete(:nickname)
      session.delete(:email)
      session.delete(:phone_number)
      session.delete(:password)
      session.delete(:password_confirmation)
      session.delete(:postcode)
      session.delete(:prefecture)
      session.delete(:city)
      session.delete(:block)
      session.delete(:building)
    end
  
    def move_to_root
      redirect_to root_path if user_signed_in?
    end
  
    def create_user_new
      @user = User.new
    end

end
