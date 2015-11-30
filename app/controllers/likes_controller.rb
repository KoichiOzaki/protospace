class LikesController < ApplicationController
  def create
    Like.create(prototype_id: params[:id], user_id: current_user.id)
    @prototype = Prototype.find(params[:id])
  end

  def destroy
    current_user.likes.find_by(prototype_id: params[:id]).destroy
    @prototype = Prototype.find(params[:id])
  end
end
