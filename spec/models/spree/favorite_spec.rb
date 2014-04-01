require 'spec_helper'

describe Spree::Favorite do

  it { should belong_to(:favorable) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:favorable) }

  describe 'scopes' do
    let!(:favorite_1) { create(:favorite, guest_token: 'test') }
    let!(:favorite_2) { create(:favorite, guest_token: 'invalid') }
    let!(:favorite_3) { create(:favorite) }
    let!(:favorite_4) { create(:favorite, guest_token: 'test') }
    let!(:favorite_5) { create(:favorite, guest_token: 'invalid') }
    let!(:favorite_6) { create(:favorite) }

    it '.by_guest_token' do
      expect(subject.class.by_guest_token('test')).to match_array([favorite_1, favorite_4])
    end
  end

end
