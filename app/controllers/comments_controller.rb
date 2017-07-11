class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new movie_params
    @comment.user_id = params[:user_id]

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_review_path(@comment.user_id, @comment.review_id), notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to :back }
      end
    end
  end

  private

  def movie_params
    params.require(:comment).permit(:txt, :review_id)
  end
end
