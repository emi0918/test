class ApplicationController < ActionController::Base

  http_basic_authenticate_with :name => "seekle", :password => "seekletestuser"

  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :setup
   #rescue_from ActiveRecord::RecordNotFound,ActionController::RoutingError, with: :error404
   #rescue_from Exception, with: :render_500
   helper_method :mailbox, :conversation



  # 例外ハンドル
  if !Rails.env.development?
    rescue_from Exception,                        with: :render_500
    rescue_from ActiveRecord::RecordNotFound,     with: :render_404
    rescue_from ActionController::RoutingError,   with: :render_404
  end

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

  def render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e

    if request.xhr?
     render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
    else
      format = params[:format] == :json ? :json : :html
      render template: 'errors/error_404', formats: format, status: 404, layout: 'application', content_type: 'text/html'
    end
  end

  def render_500(e = nil)
    logger.info "Rendering 500 with exception: #{e.message}" if e
    Airbrake.notify(e) if e # Airbrake/Errbitを使う場合はこちら

    if request.xhr?
     render file: Rails.root.join('public/500.html'), status: 500, layout: false, content_type: 'text/html'
    else
      format = params[:format] == :json ? :json : :html
      render template: 'errors/error_500', formats: format, status: 500, layout: 'application', content_type: 'text/html'
    end
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
