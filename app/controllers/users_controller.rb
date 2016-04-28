class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:new, :destroy]


  layout 'adminLayout', except: :signup

  # get /users/
  def index
    @users = User.all
  end

  # get  /users/1
  def show
    @user = User.find(params[:id])
  end

  # get  /users/new
  def new
    @user = User.new
  end

  # post /users/create
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user, notice: 'An user was successfully registered.'
    else
      render 'new'
    end
  end

  # get /users/1/edit
  def edit
  end

  # put /users/1/update
  def update
    if @user.update_attributes(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render 'edit'
    end
  end

  # delete /users/1
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end


  ## sign up for un-authorized people

  # get signup
  def signup
    if not logged_in?
      @user = User.new
    else
      redirect_to root_url, notice: 'Already signed in !'
    end
  end


  ## registration by facebook
  def facebook_create
    auth=request.env['omniauth.auth']
    session[:omniauth]=auth.except('extra')
    user=User.sign_in_from_omniauth(auth)
    session[:user_id]=user.id
    redirect_to admin_url, notice: 'You have logged in rubymon by facebook successfully !'
  end


  private


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
