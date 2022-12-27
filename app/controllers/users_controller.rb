class UsersController < ApplicationController
  before_action :set_user, only: %i[update new show destroy]
  before_action :check_access!, only: %i[index]
  def index
    @users = User.without_role(:admin)
    @users = @users.where('email LIKE ?', '%' + params[:search] + '%') if params[:search].present?
    @pagy, @users = pagy(@users)
    respond_to do |format|
      format.html
      format.json { render json: { html: render_html_table } }
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if user.update
        format.html { redirect_to user_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.required(:user).permit(:email, :password, :password_confirmation)
  end

  def check_access!
    check_authorize(current_user)
  end

  def render_html_table
    render_to_string(partial: 'users/table', formats: [:html], layout: false, locals: { users: @users })
  end
end
