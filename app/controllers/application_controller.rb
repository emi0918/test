class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception


  # rescue_from ActiveRecord::RecordNotFound,ActionController::RoutingError, with: :error404
  # rescue_from Exception, with: :render_500


  # def error_404(exception = nil)
  #  render 'error404', status: 404, formats: [:html]
  # end


  # def error_500(exception = nil)
  #   logger.error [e,*e.backtrace].join ("¥n")
  #    render 'error500', status: 500, formats: [:html]
  # end
end
