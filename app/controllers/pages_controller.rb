class PagesController < ApplicationController
  before_action :require_logged_in, only: [:dashboard]
  def home
    redirect_to dashboard_path if current_user
  end

  def dashboard
    @groups = current_user.all_groups
    @trains = nil
  end
end
