class AdminController < ApplicationController
  def index
    @players = Player.all
    @players_with_pictures = Player.count(:avatar_file_name)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end


end
