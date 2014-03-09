require 'spec_helper'

describe User do
  context '#peers' do
    let(:organization) { FactoryGirl.create(:organization) }
    let(:user)  { FactoryGirl.create(:user) }
    let(:peer1) { FactoryGirl.create(:user) }
    let(:peer2) { FactoryGirl.create(:user) }

    before do
      organization.users << user
      organization.users << peer1
      organization.users << peer2
    end

    it 'returns the peers of the user' do
      user.peers.should == [ peer1, peer2 ]
    end
  end
end
