<<<<<<< HEAD
class DashboardController < ApplicationController
=======
 class DashboardController < ApplicationController
>>>>>>> responsive_seekle
  before_action :authenticate_user!

  helper_method :current_user, :logged_in?


  def show
    @notes = @user.notes
    @user_name = User.find(params[:id])
    @area = User.find(params[:id])
<<<<<<< HEAD
  end
=======
   end
>>>>>>> responsive_seekle

private

def current_user
  return unless session[:user_id]
<<<<<<< HEAD
  @current_user ||=User.find(session[:user_id])
end

def logged_in?
  !!session[:user_id]
end

=======
 @current_user ||=User.find(session[:user_id])
 end

def logged_in?
  !!session[:user_id]
end

>>>>>>> responsive_seekle

end


<<<<<<< HEAD

=======
>>>>>>> responsive_seekle
