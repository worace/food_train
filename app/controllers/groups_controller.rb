class GroupsController < ApplicationController
  def index
  end

  def show
    @group = Struct.new(:name).new("Turing 1409")
  end
end
