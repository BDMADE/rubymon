class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or admin_path
    else
      render 'new',alert:'Invalid email/password combination'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end