class PagesController < ApplicationController
  def home
  end

  def logged_in
    @current_user = true
  end

  def my_profile
    @current_user = true
  end
end
