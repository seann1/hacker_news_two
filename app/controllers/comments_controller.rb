class CommentsController < ApplicationController
  def index
    @comment = Comment.all
    @link = Link.find(params[:link_id])
    @comments_for_link = Comment.where(:link_id => params[:link_id])
    @comment = Comment.new
  end

  def show
    @comments = Comment.all
    @link = Post.find(params[:link_id])
    @comments_for_link = Comment.where(:link_id => params[:link_id])
    @comment = Comment.create(params[:content])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.valid?
      flash[:notice] = "Comment added."
      redirect_to root_path
    else
      render 'new'
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted."
    redirect_to show_comments_path
  end

private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
