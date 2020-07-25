# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end
  
  # POST /resource/sign_in
  # ログイン失敗後は def failed に飛ぶように変更
  def create
    auth_options = { scope: resource_name, recall: "#{controller_path}#failed" }
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

    # ログイン失敗の時は直前のURLにリダイレクトする
    def failed
      flash[:error] = "メールアドレスまたはパスワードが違います。"
      redirect_to params[:user][:url]
    end
  

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
