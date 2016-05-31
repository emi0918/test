<<<<<<< HEAD
class DashboardController < ApplicationController
=======
<<<<<<< HEAD
class DashboardController < ApplicationController
=======
 class DashboardController < ApplicationController
>>>>>>> responsive_seekle
>>>>>>> 4e725f171624d23eb9ebcf78074ad397e7cecfac
  before_action :authenticate_user!

  helper_method :current_user, :logged_in?


  def show
    @notes = @user.notes
    @user_name = User.find(params[:id])
    @area = User.find(params[:id])
<<<<<<< HEAD
  end
=======
<<<<<<< HEAD
  end
=======
   end
>>>>>>> responsive_seekle
>>>>>>> 4e725f171624d23eb9ebcf78074ad397e7cecfac

private

def current_user
  return unless session[:user_id]
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 4e725f171624d23eb9ebcf78074ad397e7cecfac
  @current_user ||=User.find(session[:user_id])
end

def logged_in?
  !!session[:user_id]
end

<<<<<<< HEAD
=======
=======
 @current_user ||=User.find(session[:user_id])
 end

def logged_in?
  !!session[:user_id]
end

>>>>>>> responsive_seekle
>>>>>>> 4e725f171624d23eb9ebcf78074ad397e7cecfac

end


<<<<<<< HEAD

=======
<<<<<<< HEAD

=======
>>>>>>> responsive_seekle
>>>>>>> 4e725f171624d23eb9ebcf78074ad397e7cecfac
