class UsersController < ApplicationController
  def index
  end
  def edit
  end
  def update
    current_user.update(update_params)
    redirect_to root_path, notice: "Update successfully."
  end
  private
  def update_params
    params.require(:user).permit(:email, :member, :profile, :works, :username)
  end
end
