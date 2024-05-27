class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin
  
    def user_management
      @users = User.all
    end
  
    def block_user
      id = params[:id]
      User.unscoped.where(id: id).update_all(blocked: "blocked")
      redirect_to admin_user_management_path, notice: "User blocked."
    end
  
    def unblock_user
      id = params[:id]
      User.unscoped.where(id: id).update_all(blocked: "active")
      redirect_to admin_user_management_path, notice: "User unblocked."
    end
  
    def delete_user
      id = params[:id]
      User.unscoped.where(id: id).destroy_all
      redirect_to admin_user_management_path, notice: "User deleted."
    end
  
    def add_admin
      id = params[:id]
      User.unscoped.where(id: id).update_all(admin: "admin")
      redirect_to admin_user_management_path, notice: "User added to admins."
    end
  
    def remove_admin
      id = params[:id]
      User.unscoped.where(id: id).update_all(admin: "user")
      redirect_to admin_user_management_path, notice: "User removed from admins."
    end
  
    private
  
    def check_admin
      redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin == "admin"
    end
end
  