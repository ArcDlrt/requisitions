require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  let(:data) { { provider: 'Facebook', uid: 'm92mdas9', info: { email: 'titopuente@requisitions.com' } } }

  before(:each) do
    OmniAuth.config.test_mode = true
  end

  context "POST #facebook success" do
    before(:each) do
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(data)

      request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end

    it "creates a new user and redirect to create profile" do
      post :facebook
      expect(User.first).to be_persisted
      expect(response).to redirect_to(new_profile_path)
    end
  end

  context "POST #facebook fail" do
    before(:each) do
      OmniAuth.config.mock_auth[:facebook] = nil

      request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end

    it "redirects to root on failure" do
      post :facebook
      expect(response).to redirect_to(root_path)
    end
  end

  after(:each) do
    OmniAuth.config.mock_auth[:facebook] = nil
  end
end