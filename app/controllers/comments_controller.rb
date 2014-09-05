class CommentsController < ApplicationController
  def index
    @comment = Comment.all
    @link = Link.find(params[:link_id])
    @comments_for_link = Comment.where(:link_id => params[:link_id])
    @comment = Comment.new
  end

  def show
    @comments = Comment.all
    @link = Link.find(params[:link_id])
    @comments_for_link = Comment.where(:link_id => params[:link_id])
    @comment = Comment.create(params[:content])
  end

  def new
    @link = Link.find(params[:link_id])
    @comment = Comment.new
  end

  def create
    @link = Link.find(params[:link_id])
    @comment = Comment.create(comment_params)
    flash[:notice] = "Comment added."
    redirect_to link_comments_path
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted."
    redirect_to show_comments_path
  end

private

  def comment_params
    params.require(:comment).permit(:content, :link_id)
  end
end
