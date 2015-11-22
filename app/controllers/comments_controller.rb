class CommentsController < ApplicationController
  def create
      Comment.create(comment_params) if authenticate_user!
      redirect_to :back, notice: "Post the new Comment successfully."
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
  end
end
