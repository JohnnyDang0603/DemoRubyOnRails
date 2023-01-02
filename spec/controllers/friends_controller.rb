require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
  let!(:user) { create(:user) }
  def do_request(user)
    sign_in user if user
  end

  before do
    do_request(user)
  end
  describe 'GET #index' do
    let!(:friends) { create_list(:friend, 5, user: user) }

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(assigns(:friends)).to eq user.friends
    end
  end

  describe 'GET #show' do
    let!(:friend) { create(:friend) }
    it 'returns http success' do
      get :show, params: { id: friend.id}
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(assigns(:friend)).to eq friend
    end
  end

  describe 'Post #destroy' do
    let!(:friend) { create(:friend) }

    it 'should delete friend' do
      delete :destroy, params: { id: friend.id }
      expect(flash[:notice]).to eq('Friend was successfully destroyed.')
      expect(response).to redirect_to friends_url
    end
  end

  # describe 'Post #new' do
  #   let!(:friend) { create(:friend) }

  #   it 'should success and render to new page' do
  #     get :new
  #     expect(assigns(:friend)).to eq([friend])
  #     expect(response).to render_template(:new)
  #   end
  # end

  describe 'Post #create' do
    let!(:friend1) { create(:friend) }

    it 'create a new friend' do
      post :create, params: { friend: attributes_for(:friend) }
      expect(flash[:notice]).to eq('Add friend successfully.')
      expect(response).to redirect_to friends_path
    end
  end

  # describe 'PUT #update' do
  #   let!(:friend) { create(:friend, user: user) }

  #   it 'update a friend' do
  #     # patch :update, id: friend.id, friend: {  attributes_for(:friend) }
  #     expect(flash[:notice]).to eq('Update friend')
  #     expect(friend.first_name).to eq(params[:fisrt_name])
  #   end
  # end

  # describe 'GET #edit' do
  #   let!(:friend) { create(:friend) }

  #   def do_request(user)
  #     sign_in user if user
  #     get :edit, { id: friend.id}
  #     friend.reload
  #   end

  #   before do
  #     do_request(user)
  #   end

  #   it 'update a friend' do
  #     expect(responese).to
  #     expect(flash[:notice]).to eq('Update friend')
  #     expect(friend.first_name).to eq(params[:fisrt_name])
  #   end
  # end

end
