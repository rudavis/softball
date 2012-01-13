class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  

#take user to their card page after login  
  def after_sign_in_path_for(resource)
    player_path(current_player)
  end

#This next section defines 1st user exp.
  def after_sign_up_path_for(resource)
      player_path(current_player)
  end
  

end
