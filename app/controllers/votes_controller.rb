class VotesController < ApplicationController
  before_action :require_in_group, only: [:create]
  before_action :require_not_yet_voted, only: [:create]
  def create
    train_option = TrainOption.find_by(id: params[:id])
    if train_option
      Vote.create(user: current_user, train_option: train_option)
      flash[:notice] = "Vote Placed"
    else
      flash[:notice] = "That option does not exist"
    end
    redirect_to :back
  end

  def require_in_group
    option = TrainOption.find_by(id: params[:id])
    return unless option
    unless option.train.group.users.exists? current_user
      redirect_to :back, notice: "you're not in this group"
    end
  end

  def require_not_yet_voted
    if Vote.exists? user: current_user, train_option: params[:id]
      redirect_to :back, notice: "You've already voted"
    end
  end
end
