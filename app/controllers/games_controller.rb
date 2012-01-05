class GamesController < ApplicationController
  def create
    @player = Player.find(params[:player_id])
    @game = @player.games.create(params[:game])
#    redirect_to player_path(@player)
    redirect_to player_path(@player), notice: 'Game was successfully added.'
  end
  
  
=begin
    @player = Player.find(params[:player_id])
    @game = @player.games.new(params[:game])
    respond_to do |format|
      if @game.save
        format.html { redirect_to player_path(@player), notice: 'Game was successfully created.' }
        format.json { render json: @player, status: :created, location: @player }
      else
        # Passing error messages in @game to Player - Show controller.  
        format.html { redirect_to player_path(@player), notice: 'FAIL'}
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
=end
end