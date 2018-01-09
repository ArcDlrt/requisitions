module ApplicationHelper

  def link_for_navbar
    if current_user
      current_user.profile.present? ? requisitions_path : root_path
    else
      root_path
    end
  end
end
