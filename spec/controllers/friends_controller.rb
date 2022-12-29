require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
  let!(:user) { create(:user) }
  describe 'GET #index' do
    let!(:friends) { create_list(:friend, 5, user: user) }
    def do_request(user)
      sign_in user if user
      get :index
    end

    before do
      do_request(user)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(assigns(:friends)).to eq user.friends
    end
  end

  describe 'GET #show' do
    let!(:friend) { create(:friend) }

    def do_request(user, params)
      sign_in user if user
      get :show, params: params
    end

    before do
      do_request(user, { id: friend.id })
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(assigns(:friend)).to eq friend
    end
  end

  describe 'Post #destroy' do
    let!(:friend) { create(:friend) }

    def do_request(user, params)
      sign_in user if user
      delete :destroy, params: params
    end

    before do
      do_request(user, { id: friend.id })
    end
    it 'should delete friend' do
      expect(flash[:notice]).to eq('Friend was successfully destroyed.')
      expect(response).to redirect_to friends_url
    end
  end

  describe 'Post #new' do
    let!(:friend1) { create(:friend) }

    def do_request(user)
      sign_in user if user
    end

    before do
      do_request(user)
    end
    it 'should success and render to new page' do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'Post #create' do
    let!(:friend1) { create(:friend) }

    def do_request(user)
      sign_in user if user
      post :create, params: { friend: attributes_for(:friend) }
    end

    before do
      do_request(user)
    end

    it 'create a new friend' do
      expect(flash[:notice]).to eq('Add friend successfully.')
      expect(response).to redirect_to friends_path
    end
  end

  describe 'PUT #update' do
    let!(:friend) { create(:friend) }

    def do_request(user)
      sign_in user if user
      put :update, { id: friend.id, friend: friend }
      friend.reload
    end

    before do
      do_request(user)
    end

    it 'update a friend' do
      expect(flash[:notice]).to eq('Update friend')
      expect(friend.first_name).to eq(params[:fisrt_name])
    end
  end

  describe 'GET #edit' do
    let!(:friend) { create(:friend) }

    def do_request(user)
      sign_in user if user
      get :edit, { id: friend.id}
      friend.reload
    end

    before do
      do_request(user)
    end

    it 'update a friend' do
      expect(responese).to
      expect(flash[:notice]).to eq('Update friend')
      expect(friend.first_name).to eq(params[:fisrt_name])
    end
  end

end
