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
    if params[:parent_comment_id] != nil
      @parent_comment = Comment.find(params[:parent_comment_id])
      @user = User.find(params[:user_id])
      @comment = @parent_comment.comments.new(comment_params)
      @user.comments << @comment

      @user.save
      @parent_comment.save
      @link = Link.find(params[:link_id])
      flash[:notice] = "Reply added."
    elsif params[:link_id] != nil

      @link = Link.find(params[:link_id])
      @user = User.find(params[:user_id])
      @comment = Link.comments.new(comment_params)
      @link.comments << @comment
      @user.comments << @comment

      @user.save
      flash[:notice] = "Comment added."
      redirect_to link_comments_path
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
    params.require(:comment).permit(:content, :link_id, :parent_comment_id, :user_id)
  end
end
