# [omiend] インテンドは注意するように
class ApplicationController < ActionController::Base
# ログインしてないと飛ばされる
    before_action :authenticate_user!

# 追加
     before_action :configure_permitted_parameters, if: :devise_controller?

    #  ログインをユーザー名でもアドレスでもログインできるようにするやつ
    protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
        devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
      end
end