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
#    redirect_to player_path(@player)
    redirect_to player_path(@player), notice: 'Game was successfully added.'
  end
  
  def edit
    @player = Player.find(params[:player_id])
    @game = @player.games.find(params[:id])
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