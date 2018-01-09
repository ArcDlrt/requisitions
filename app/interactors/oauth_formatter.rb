class OauthFormatter
  include Interactor

  before do
    context.fail!(message: "expect field <data> is missing") unless context.data.present?
  end

  def call
    set_user_data
    set_profile_data
  end

  private

  def set_user_data
    context.user_data = {
      email: context.data['info']['email'],
      provider: context.data['provider'],
      uid: context.data['uid']
    }
  end

  def set_profile_data
    context.profile_data = {
      first_name: context.data['info']['first_name'],
      last_name: context.data['info']['last_name']
    }
  end

end