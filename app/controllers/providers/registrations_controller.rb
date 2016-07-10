class Providers::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
 before_action :authenticate_provider!
layout "providers_layout"
  def show
   @provider = Provider.find_by(id: params[:id])
  end

def new
  @provider=Provider.new
end

  def edit
  end

def create
  @provider = Provider.new(provider_params)
  if @provider.save
    # @userはuser_path(@user) に自動変換される
    redirect_to providers_main_path 
  else
    # ValidationエラーなどでDBに保存できない場合 new.html.erb を再表示
    render 'new'
  end
end


  def update
   
    if @provider.update(provider_params)
      redirect_to providers_path
    else
      render 'edit'
    end
  end


  private
    # Rails4からStrongParamaterと呼ばれる機能が追加されました。
    # セキュリティのため、permitメソッドで許可したパラメータ名しか取得できません。
    def provider_params
      params.require(:provider).permit(:storename, :email,:phonenumber, :address, :hours, :holiday, :payment, :password,:about, :provider)
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


