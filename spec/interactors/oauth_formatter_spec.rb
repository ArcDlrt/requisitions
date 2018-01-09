require 'rails_helper'
require_relative '../../spec/support/omniauth_fake_responses'

RSpec.describe OauthFormatter do
  context 'call' do

    let(:omniauth_response) { OmniauthFakeResponses::all_data }

    it "returns an error if field <data> isn't received" do
      action = OauthFormatter.call

      expect(action.success?).to_not be_truthy
    end

    it "returns formatted user_data" do
      action = OauthFormatter.call(data: omniauth_response)

      expect(action.user_data).to be_present

      user_fields.each{ |field|  expect(action.user_data[field]).to be_present }
      expect(action.user_data[:provider]).to eq("Facebook")
    end

    it "returns formatted profile_data" do
      action = OauthFormatter.call(data: omniauth_response)

      expect(action.profile_data).to be_present
      profile_fields.each{ |field|  expect(action.profile_data[field]).to be_present }
    end

  end

  def user_fields
    [:email, :uid, :provider]
  end

  def profile_fields
    [:first_name, :last_name]
  end
end