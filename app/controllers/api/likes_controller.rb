class Api::LikesController < ApplicationController
  def create
    Like.create(prototype_id: params[:prototype_id], user_id: current_user.id)
    likes_count = Like.where(prototype_id: params[:prototype_id]).count
    render json: { count: likes_count }
  end

  def destroy
    current_user.likes.find_by(prototype_id: params[:prototype_id]).destroy
    likes_count = Like.where(prototype_id: params[:prototype_id]).count
    render json: { count: likes_count }
  end
end
