class ApplicationController < ActionController::Base

  http_basic_authenticate_with :name => "seekle", :password => "seekletestuser"

  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :setup
   #rescue_from ActiveRecord::RecordNotFound,ActionController::RoutingError, with: :error404
   #rescue_from Exception, with: :render_500
   helper_method :mailbox, :conversation





rescue_from ActiveRecord::RecordNotFound, with: :render_404
rescue_from ActionController::RoutingError, with: :render_404
rescue_from Exception, with: :render_500

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
       profile_providers_path
      end
    end


    private

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name << :area << :profile << :mainpic

      devise_parameter_sanitizer.for(:account_update) << :name << :area << :profile << :mainpic
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
