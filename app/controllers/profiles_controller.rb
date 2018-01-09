class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      flash[:notice] = 'Updated profile'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name,
                                    :second_name,
                                    :second_last_name,
                                    :first_last_name,
                                    :birth_date,
                                    :curp,
                                    :rfc,
                                    :gender,
                                    :birth_state,
                                    :phone_number
    )
  end

end