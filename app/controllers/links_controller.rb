class LinksController < ApplicationController
  def index
    @links = Link.all
    @links = @links.all.sort_by {|x| x.point}.reverse
    @vote = Vote.create(:link_id => params[:link_id])
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(link_params)
    if @link.valid?
      flash[:notice] = "This link has been added."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    flash[:notice] = "Your link has been updated."
    redirect_to root_path
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = "This link has been deleted."
    redirect_to root_path
  end

private
  def link_params
    params.require(:link).permit(:url, :title, :point)
  end
end
