class DashboardController < ApplicationController
  before_action :authenticate_user!

  helper_method :current_user, :logged_in?


  def show
    @notes = @user.notes
    @user_name = User.find(params[:id])
    @area = User.find(params[:id])
  end

private

def current_user
  return unless session[:user_id]
  @current_user ||=User.find(session[:user_id])
end

def logged_in?
  !!session[:user_id]
end


end

