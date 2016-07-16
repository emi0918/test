class ApplicationController < ActionController::Base

  http_basic_authenticate_with :name => "seekle", :password => "seekleforthetestuser"

  # protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_filter :setup
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

def render_404
  render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
end

def render500
  render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
end
    #protect_from_forgery
def after_sign_in_path_for(resources)
  case resources
   when User
    users_path
   when Provider
    main_providers_path
  end
  end

private

def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_name << :area << :profile << :profile_pic

     devise_parameter_sanitizer.for(:account_update) << :user_name << :area << :profile << :profile_pic
  end

  private

end

def setup
  if session[:user_id]
    if session[:persistent] # 「ログイン状態を保持する」チェックボックスをチェックしたらtrueになるようにしておく
      session.instance_variable_get(:@dbman).instance_variable_get(:@cookie_options)['expires'] = 3.months.from_now # ここが要所！
      session[:persistent] = Time.now 
    end

    # Fetch the user record.
    @user = User.find_by_id(session[:user_id], :readonly => true)
  end
end




