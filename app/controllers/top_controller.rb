class TopController < ApplicationController
  def index
    @prototypes = Prototype.all.page(params[:page]).eager_load(:prototype_images, :user)
  end

  def newest
    @prototypes = Prototype.order(created_at: :desc).page(params[:page]).eager_load(:prototype_images, :user)
  end
end
