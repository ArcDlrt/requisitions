class Devise::SessionsController < DeviseController

  # GET /resource/sign_in
  def new
    redirect_to root_path
  end

end
