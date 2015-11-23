class LikesController < ApplicationController
  def create
    Like.create({prototype_id: params[:prototype_id], user_id: current_user.id})
    redirect_to :back, notice: "like!"
  end

  def destroy
    current_user.likes.find_by(params[:prototype_id]).destroy
    redirect_to :back, notice: "cancel like!"
  end
end
