class TopController < ApplicationController
  def index
    @prototypes = Prototype.all.page(params[:page]).includes(:prototype_images, :user)
  end
end
