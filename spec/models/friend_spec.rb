require 'rails_helper'
require 'friend'
RSpec.describe Friend, type: :model do
  # shoulda-matchers
  describe 'validation' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_length_of(:phone).is_at_least(10) }
    it { is_expected.to validate_length_of(:phone).is_at_most(15) }
  end

  # fatory bot
  # context "validation tests" do
  #   let(:friend) { build(:invalid_friend) }
  #   it 'ensure last name presence' do
  #     expect(friend.save).to eq(false)
  #   end
  # end
  #   it 'ensure first name presence' do
  #     friend.last_name = nil
  #     expect(friend.save).to eq(false)
  #   end
  # end
end
