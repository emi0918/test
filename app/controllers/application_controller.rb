class ApplicationController < ActionController::Base

      


  # protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?

   #rescue_from ActiveRecord::RecordNotFound,ActionController::RoutingError, with: :error404
   #rescue_from Exception, with: :render_500
helper_method :mailbox, :conversation

  # def error_404(exception = nil)
   # render 'error404', status: 404, formats: [:html]
  # en d
  # def error_500(exception = nil)
    # logger.error [e,*e.backtrace].join ("¥n")
     # render 'error500', status: 500, formats: [:html]
  # end

    #protect_from_forgery

  def after_sign_out_path_for resource
    root_path
  end

  def after_sign_in_path_for(resource)
   users_path
  end


private

def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_name << :area << :profile << :profile_pic

     devise_parameter_sanitizer.for(:account_update) << :user_name << :area << :profile << :profile_pic
  end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end
 def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end



end



