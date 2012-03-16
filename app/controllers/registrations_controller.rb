class RegistrationsController < Devise::RegistrationsController
  protected


#This next section defines 1st user exp.
  def after_sign_up_path_for(resource)
    edit_player_path(current_player)
  end
#After changing password
  def after_update_path_for(resource)
    player_path(current_player)
  end
end