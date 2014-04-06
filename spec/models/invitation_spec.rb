require 'spec_helper'

describe Invitation do
  let(:manager) { FactoryGirl.create(:user) }
  let(:org) { FactoryGirl.create(:organization) }
  let(:inv) do
    FactoryGirl.create(:invitation, sender: manager,
                       organization: org, recipient_email: 'nicole@gmail.com')
  end

  it 'generates a token before save' do
    inv = FactoryGirl.build(:invitation, sender: manager, organization: org,
                      recipient_email: 'nicole@gmail.com')
    inv.token.should be_blank
    inv.save!

    inv.token.should be_present
  end

  it 'is valid if not used' do
    inv.should_not be_invalid
  end

  it 'is invalid if already used' do
    inv.should_not be_invalid
    inv.mark_used!
    inv.should be_invalid
  end
end
