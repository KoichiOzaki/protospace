class UsersController < ApplicationController
  def show
    @prototypes = current_user.prototypes.includes(:prototype_images)
  end

  def edit
  end

  def update
    if current_user.update(update_params)
      redirect_to root_path, notice: "Update profile successfully."
    else
      render :edit
    end
  end

  private
  def update_params
    params.require(:user).permit(:email, :member, :profile, :works, :username, :avatar)
  end
end
