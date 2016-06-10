class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_from :facebook
  end


  def fa

 private
    def callback_from(provider)
      provider = provider.to_s
      @user = User.find_for_oauth(request.env['omniauth.auth'])
      if @user.persisted?
        cookies.permanent[:xxx_logined] = { value: @user.created_at }
        flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
        sign_in_and_redirect @user, event: :authentication
      else
        if provider == 'twitter'
          session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
        else
          session["devise.facebook_data"] = request.env["omniauth.auth"]
        end
        redirect_to users_path
      end
    end
end
