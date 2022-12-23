class UsersController < ApplicationController
  before_action :check_access!, only: %i[index]
  def index
    @users = User.without_role(:admin)
    @users = @users.where("email LIKE ?","%"+params[:search]+"%") if params[:search].present?
    @pagy, @users = pagy(@users)
    respond_to do |format|
      format.html
      format.json { render json: { html: render_html_table } }
    end
  end

  private

  def check_access!
    check_authorize(current_user)
  end

  def render_html_table
    render_to_string(partial: 'users/table', formats: [:html], layout: false, locals: { users: @users })
  end

end
