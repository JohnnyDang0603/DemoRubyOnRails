require 'rails_helper'
require 'friend'
RSpec.describe Friend, type: :model do
  describe "validation" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_length_of(:phone).is_at_least(10) }
    it { is_expected.to validate_length_of(:phone).is_at_most(15) }
  end
end
