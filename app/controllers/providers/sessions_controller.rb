class Providers::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
 before_action :authenticate_provider!
layout "providers_layout"

  # GET /resource/sign_in
  # def new
  #   super
  # end
   def after_sign_in_path_for(resources)
     
       profile_providers_path
 
    end


  # POST /resource/sign_in
  # def create
  #   super
  # end

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
