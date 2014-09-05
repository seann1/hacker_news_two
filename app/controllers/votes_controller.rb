class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.create(vote_params)
    flash[:notice] = "Your vote has been added."
    redirect_to root_path
    @vote.one_point
  end

  def edit

  end

  def update
  end

private

  def vote_params
    params.require(:vote).permit(:link_id)
  end
end
