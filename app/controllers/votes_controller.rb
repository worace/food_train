class VotesController < ApplicationController
  before_action :require_logged_in, only: [:create]
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
end
