class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: "Post the new PROTO successfully."
    else
      render :new
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(
      :catchcopy,
      :concept,
      :title,
      prototype_images_attributes: [:id, :image, :pr_flag]
      ).merge(user_id: current_user.id)
  end
end
