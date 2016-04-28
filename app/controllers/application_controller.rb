class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private

# Before filters
# Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      redirect_to login_url,alert: 'Please log in'
    end
  end



  ## find out admin user
  def is_admin?
    current_user.admin
  end

# Confirms an admin user.
  def admin_user
    redirect_to admin_url, alert: 'You have not permission to access this section !' unless is_admin?
  end

# Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to admin_url,alert:'You do not have any permission to access this section ! Thank you.' unless current_user?(@user)||is_admin?
  end

## helper method
  helper_method :logged_in_user
  helper_method :correct_user
  helper_method :admin_user
  helper_method :is_admin?

end
