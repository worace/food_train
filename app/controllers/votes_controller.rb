class VotesController < ApplicationController
  def create
    require_logged_in
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
