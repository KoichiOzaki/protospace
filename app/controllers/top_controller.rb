class TopController < ApplicationController
  def index
    @prototypes = Prototype.order(likes_count: :desc).page(params[:page]).eager_load(:prototype_images, :user, :tags)
  end

  def newest
    @prototypes = Prototype.order(created_at: :desc).page(params[:page]).eager_load(:prototype_images, :user, :tags)
  end
end
