class AdminController < ApplicationController
  before_action :authenticate_admin
  
  def index
  end
  
  def authenticate_admin
    unless current_user && current_user.role == "admin"
      redirect_to '/'
    end
  end
end
