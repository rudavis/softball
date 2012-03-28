class AdminController < ApplicationController
  before_filter :verify_admin
  
  def index
    @players = Player.all
    @players_with_pictures = Player.count(:avatar_file_name)
    @player = Player.find(current_player)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  protected
    def verify_admin
      (current_player.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_player.admin?)
    end

end
