class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def update
    if current_user.is_admin? && user_params[:is_admin].present?
      @user.update(user_params)
    else
      @user.update(user_params.except(:is_admin)) # Prevent non-admins from changing is_admin
    end

    if @user.save
      redirect_to users_path, notice: "User updated successfully"
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :role, :photo, :is_admin)
  end
end
