class PagesController < ApplicationController
  def home
  end

  def logged_in
    @current_user = true
  end

  def groups_index
  end
end
