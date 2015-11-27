class TagsController < ApplicationController
  def show
    @prototypes = Prototype.tagged_with(params[:tag_name]).page(params[:page])
  end
end
