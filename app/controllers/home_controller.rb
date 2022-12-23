class HomeController < ApplicationController
  def index
    @friends = current_user.friends if current_user.present?
  end

  def about

  end

end
