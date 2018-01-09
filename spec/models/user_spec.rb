require 'rails_helper'

RSpec.describe User, type: :model do
  context '#create' do
    let(:user) { create(:user) }

    it "creates a new user" do
      user = FactoryGirl.create(:user)
      expect(user).to be_persisted
    end

    it "fails to create an user without email" do
      user = FactoryGirl.build(:user_no_email)
      expect(user.valid?).to_not be_truthy
      expect(user.errors.messages[:email][0]).to eq("can't be blank")
    end
  end

  context "#from_omniauth" do
    let(:data) { { provider: "Facebook", uid: "0mv0amkld", email: "titopuente@requisitions.com" } }

    it "creates a new user" do
      user = User.from_omniauth(data)
      expect(user).to be_persisted
    end

  end
end
