class PagesController < ApplicationController
  skip_authorization_check

  def dashboard
    @users = User.all
  end

  def change_role
    @user = User.find(params[:id])
    if @user.admin?
      @user.visit!
    else
      @user.admin!
    end
    redirect_to pages_dashboard_path, notice: 'User role changed'
  end

  def remove_user
    @user = User.find(params[:id])
    if current_user.admin?
      @user.destroy
      redirect_to pages_dashboard_path, notice: 'User deleted'
    else
      redirect_to pages_dashboard_path, notice: 'You have no permmissions to remove users'
    end
  end

end
