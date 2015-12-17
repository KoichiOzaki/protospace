class TagsController < ApplicationController
  def index
    @uis_tags = Prototype.all_tags(on: :uis)
    @designs_tags = Prototype.all_tags(on: :designs)
    @applications_tags = Prototype.all_tags(on: :applications)
  end

  def show
    @prototypes = Prototype.tagged_with(params[:tag_name]).eager_load(:user).page(params[:page])
  end
end
