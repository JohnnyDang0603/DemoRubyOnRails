class FriendsController < ApplicationController
  before_action :authenticate_user!, expect: %i[show index]
  before_action :set_friend, only: %i[show edit update destroy]
  # before_action :check_access!, only: %i[index]
  def index
    flash[:alert] = 'this is index'
    @friends = current_user&.admin? ? Friend.all : current_user.friends
    @friends = @friends.where('first_name LIKE ?', '%' + params[:search] + '%') if params[:search].present?
    @pagy, @friends = pagy(@friends)
    respond_to do |format|
      format.html
      format.json { render json: { html: render_html_table } }
    end
  end

  def show; end

  def new
    @friend = current_user.friends.build
  end

  def create
    @friend = current_user.friends.create(friends_params)
    respond_to do |format|
      if @friend.save
        format.html { redirect_to friends_path, notice: 'Add friend successfully.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @friend.update(friends_params)
        format.html { redirect_to friends_path, notice: 'Update friend' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
    end
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friends_params
    params.require(:friend).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
  end

  def render_html_table
    render_to_string(partial: 'friends/table', formats: [:html], layout: false, locals: { friends: @friends })
  end

  def check_access!
    check_authorize(current_user)
  end
end
