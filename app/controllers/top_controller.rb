class TopController < ApplicationController
  def index
    @prototypes = Prototype.all.page(params[:page]).eager_load(:prototype_images, :user)
  end
end
