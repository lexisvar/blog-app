class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, alert: 'Failed to create comment.'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.post, notice: 'Comment was successfully deleted.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
