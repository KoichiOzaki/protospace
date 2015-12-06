class TagsController < ApplicationController
  def show
    @prototypes = Prototype.tagged_with(params[:tag_name]).eager_load(:user).page(params[:page])
  end
end
