class GamesController < ApplicationController

  def index
    @player = Player.find(params[:player_id])
    @games = @player.games.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  def create
    @player = Player.find(params[:player_id])
    @game = @player.games.create(params[:game])
    redirect_to player_path(@player), notice: 'Game was successfully added.'
  end
  
  def edit
    @player = Player.find(params[:player_id])
    @game = @player.games.find(params[:id])
  end
  
  def update
    @game = Game.find(params[:id])
    
    respond_to do |format|
      if @game.update_attributes(params[:game])
            format.html  { redirect_to(player_games_path(:player_id => @game.player_id),
                          :notice => 'Game was successfully updated.') }
            format.json  { head :no_content }
          else
            format.html  { render :action => "edit" }
            format.json  { render :json => @game.errors,
                          :status => :unprocessable_entity }
      end
    end
  end
end