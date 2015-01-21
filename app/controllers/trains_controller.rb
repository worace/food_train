class TrainsController < ApplicationController
  def create
    @train = Train.new train_params.merge(group_id: params[:group_id])
    @train.save
    redirect_to group_path(params[:group_id])
  end

  def new
    @train = Train.new
    @train_options = Train::MAX_OPTIONS.times.map { TrainOption.new train: @train }
  end

  private
  def train_params
    params.require(:train).permit(:departure_time, train_options_attributes: [:place])
  end
end
