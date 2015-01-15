class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.includes(:owner, :users, trains: [train_options: [:votes]]).find_by(id: params[:id])
  end
end
