module ControllerMacros
  # 単体テストでログイン・非ログインなしを判定する
  def login(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end
end