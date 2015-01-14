class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.includes(:owner, :users).find_by(id: params[:id])
  end
end
