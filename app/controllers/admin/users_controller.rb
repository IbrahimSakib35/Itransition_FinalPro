class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin
  
    def index
      @users = User.all
    end
  
    def block
      user = User.find(params[:id])
      user.update(blocked: true)
      redirect_to admin_users_path, notice: "User blocked."
    end
  
    def unblock
      user = User.find(params[:id])
      user.update(blocked: false)
      redirect_to admin_users_path, notice: "User unblocked."
    end
  
    def destroy
      user = User.find(params[:id])
      user.destroy
      redirect_to admin_users_path, notice: "User deleted."
    end
  
    def add_admin
      user = User.find(params[:id])
      user.update(admin: true)
      redirect_to admin_users_path, notice: "User added to admins."
    end
  
    def remove_admin
      user = User.find(params[:id])
      user.update(admin: false)
      redirect_to admin_users_path, notice: "User removed from admins."
    end
  
    private
  
    def check_admin
      redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin?
    end
end
  