require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  context "GET #new" do
    login_user

    it "request fail if no user is logged in" do
      sign_out @user
      get :new

      expect(response.success?).to_not be_truthy
    end

    it "request success" do
      get :new

      expect(response).to have_http_status(:success)
    end

    after(:each) do
      sign_out @user
    end
  end
end