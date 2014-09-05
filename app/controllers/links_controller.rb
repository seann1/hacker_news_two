class LinksController < ApplicationController
  def index
    @links = Link.all
    @links = @links.all.sort_by {|x| x.points}.reverse
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    flash[:notice] = "Your link has been updated"
    redirect_to root_path
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = "This link has been deleted"
    redirect_to root_path
  end

  def add_point
    @link = Link.find(params[:id])
    @link.one_point
    flash[:notice] = "Plus one point"
    redirect_to root_path
  end

  private
    def link_params
      params.require(:link).permit(:url, :comment, :point, :user_id)
    end



end
