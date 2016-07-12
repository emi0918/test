class ProvidersController < ApplicationController
 before_action :set_provider, only:[:index,:show,:edit,:update, :destroy]
 before_action :authenticate_provider!
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
layout "providers_layout"


 def index
 	@providers= Provider.all
  @provider = Provider.includes(:notes)
end

def main
end








  private

  def set_provider
    current_provider  # (1)
    if params[:provider]
      if provider = Provider.find_by_login(params[:provider])  # (2)
        @provider = provider # (3)
      else
        render :text => 'user not found' and return  # (4)
      end
    else
      @provider = @current_provider # (5)
    end
  end
  
    # Rails4からStrongParamaterと呼ばれる機能が追加されました。
    # セキュリティのため、permitメソッドで許可したパラメータ名しか取得できません。
    def provider_params
      params.require(:provider).permit(:storename, :email,:phonenumber, :address, :hours, :holiday, :payment, :password,:about, :provider, :provider_pic)
    end



  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end


