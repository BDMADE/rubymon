class HomeController < ApplicationController
layout 'layouts/adminLayout',except: :index
before_action :logged_in_user, only: :admin
  
  def index
  end

  def admin
  end
end
