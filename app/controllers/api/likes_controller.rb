class Api::LikesController < ApplicationController
  before_action :set_prototype, only: [:create, :destroy]

  def create
    @prototype.likes.create(user_id: current_user.id)
    likes_count = @prototype.likes.count
    render json: { count: likes_count }
  end

  def destroy
    @prototype.likes.find_by(user_id: current_user.id).destroy
    likes_count = @prototype.likes.count
    render json: { count: likes_count }
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
