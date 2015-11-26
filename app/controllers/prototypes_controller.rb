class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :check_authority, only: [:edit, :update, :destroy]

  def show
    @prototype = Prototype.eager_load({ comments: :user }).find(params[:id])
    @comment = Comment.new
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: "Post the new PROTO successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to action: :show, notice: "Update your PROTO successfully."
    else
      render :edit
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path, notice: "Destroy your PROTO successfully."
  end

  private
  def prototype_params
    params.require(:prototype).permit(
      :catchcopy,
      :concept,
      :title,
      prototype_images_attributes: [:id, :image, :pr_flag]
      )
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def check_authority
    redirect_to root_path unless @prototype.user == current_user
  end
end
