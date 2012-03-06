class PlayersController < ApplicationController
  before_filter :authenticate_player!
  layout :resolve_layout
  

  # GET /players
  # GET /players.json
  def index
    @player = Player.new
    @players = Player.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])
    if @player.games.count >= 1
      @last_team_name = @player.games.find(:last).team_name
      @year = @player.games.first.date.year
      @newest_year = @player.games.last.date.year
    else
      @last_team_name = "Your team name"
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end
  
  def print_card
    @player = Player.find(params[:id])
    @year = @player.games.first.date.year
    @newest_year = @player.games.last.date.year

    respond_to do |format|
      format.html # print.html.erb
      format.json { render json: @player }
    end
  end 

  # GET /players/new
  # GET /players/new.json
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Welcome!  Player was successfully created.' }
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end  
  
  # GET /player/1/crop
  def crop
    @player = Player.find(params[:id])
  end

  def process_crop
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
          format.html { redirect_to @player, notice: 'Thanks!  Your picture was cropped.' }
          format.json { head :ok }
      else
        format.html { render action: "crop" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /player/1/upload
  def upload
    @player = Player.find(params[:id])
    
    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to crop_player_path(@player), notice: 'Picture was uploaded.' }
        format.json { head :ok }
      else 
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      # They DID NOT select a file to upload
      if params[:player][:avatar].blank?
          @player.update_attributes(params[:player])
            format.html { redirect_to @player, notice: 'Player was successfully updated.' }
            format.json { head :ok }
      else # They DID select a file to upload and:
        # 1st time they've uplaoded a file
        # Upload the file
        # Redirect to Crop page
        if @player.avatar_file_name.blank?
            @player.update_attributes(params[:player])
              format.html { redirect_to crop_player_path(@player), notice: 'Please crop.' }
              format.json {head :ok }
        else
          # They have uploaded a file once before
          # need to remove their old cropping values 
            @player.update_attributes(:crop_x => '', :crop_y => '', :crop_w => '', :crop_h => '')
            @player.update_attributes(params[:player])
              format.html { redirect_to crop_player_path(@player), notice: 'Please crop the new picture.' }
              format.json {head :ok }
        end
          format.html { render action: "edit" }
          format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :ok }
    end
  end
  
  private
  def resolve_layout
    case action_name
    when "print_card"
      "print_card"
    else
      "application"
    end
  end
end
