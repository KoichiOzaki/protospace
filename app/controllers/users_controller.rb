class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]
  before_action :redirect_to_top, only: [:edit, :update]

  def show
    @prototypes = @user.prototypes.page(params[:page]).eager_load(:prototype_images)
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

  def load_user
    @user = User.find(params[:id])
  end

  def redirect_to_top
    redirect_to root_path unless @user == current_user
  end
end
