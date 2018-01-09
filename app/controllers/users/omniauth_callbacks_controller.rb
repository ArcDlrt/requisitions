class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    data = OauthFormatter.call(data: request.env['omniauth.auth'])

    unless data.success?
      flash[:error] = "Something went wrong"
      redirect_to root_path
      return
    end

    session['profile_data'] = data.profile_data

    @user = User.from_omniauth(data.user_data)

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end