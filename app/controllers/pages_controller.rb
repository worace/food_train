class PagesController < ApplicationController
  def home
    redirect_to dashboard_path if current_user
  end

  def dashboard
  end

  def my_profile
  end
end
