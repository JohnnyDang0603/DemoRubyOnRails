require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  describe 'GET #index' do
    let!(:friends) { FactoryBot.create_list(:friend, 5, user: user) }
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
    let!(:friend) { FactoryBot.create(:friend) }

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

  describe 'GET #destroy' do
    let!(:friend) { FactoryBot.create(:friend) }

    def do_request(user, params)
      sign_in user if user
      get :destroy, params: params
    end

    before do
      do_request(user, { id: friend.id })
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(assigns(:friend)).to eq friend
    end
  end
end
