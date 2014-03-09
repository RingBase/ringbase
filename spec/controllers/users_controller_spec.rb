require 'spec_helper'

describe UsersController do
  context '#create' do
    let(:user) { FactoryGirl.create(:user) }
    let(:params) do
      {
        'user'  => {
          'full_name' => 'John Smith',
          'email' => 'john@gmail.com',
          'password' => 'password',
          'password_confirmation' => 'password'
        },
        'organization_name' => 'Best Travel Agency',
        'pilot_number' => '5551234567',

      }
    end

    before { login_user(user) }

    it 'creates a user' do
      expect { post :create, params }.to change { User.count }.by(1)
    end

    it 'creates an organization with the correct name' do
      expect { post :create, params }.to change { Organization.count }.by(1)
      Organization.last.name.should == 'Best Travel Agency'
    end

    it 'creates a campaign with the correct name and pilot number' do
      expect { post :create, params }.to change { Campaign.count }.by(1)
      Campaign.last.title.should == 'Best Travel Agency'
      Campaign.last.pilot_number.should == '5551234567'
    end

    it 'renders an error if invalid params are submitted' do
      pending
    end
  end
end
