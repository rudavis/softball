class PlayersController < ApplicationController
  before_filter :authenticate_player!, :except => 'print_card'
  before_filter :correct_user, :except =>'print_card'
  layout :resolve_layout
  
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
    # Check to see if they have any games?
    if @player.games.first == nil
      # They dont have any games so we want to show them a card with 0's for stats.
      # TODO:  Show 0's on cards where players don't have any games.
      ##
      ##
      # Temp hack:  redirect to show page with a flash notice.
      redirect_to @player, notice: 'Please enter at least 1 game before you print your card!'
    else
      # They do have games, so we get the years and sort 
      @year = @player.games.first.date.year
      @newest_year = @player.games.last.date.year

      # If they are sharing their card, always render.
      # if they are NOT sharing their card, only render if current_player = @player OR current_player.admin
      # Note:  (current_player != nil && current_player.admin) this is to prevent throwing a nil exception
      # for annoymous visits
      if @player.share_card == true || @player == current_player || (current_player != nil && current_player.admin)
        @share_url = "http://"+request.host+request.fullpath
        respond_to do |format|
          format.html # print.html.erb
          format.json { render json: @player }
        end
      else
        if current_player 
          redirect_to current_player, notice: 'What you looking overe there for??'
        else
          redirect_to root_path, notice: 'They dont want you to see this!'
        end 
      end 
    end
  end 

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # GET /player/1/crop
  def crop
    @player = Player.find(params[:id])
  end

  def process_crop
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
          format.html { redirect_to @player, notice: 'Thanks!  Your player has been updated' }
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
      # This checks if they are posting from the print card page.  
      if request.referer != print_card_player_url(@player)
        # They DID NOT select a file to upload
        if params[:player][:avatar].blank?
            @player.update_attributes(params[:player])
              format.html { redirect_to @player, notice: 'Account has been updated.' }
              format.json { head :ok }
        else # They DID select a file to upload and:
          # 1st time they've uplaoded a file
          # Upload the file
          # Redirect to Crop page
          if @player.avatar_file_name.blank?
              @player.update_attributes(params[:player])
                format.html { redirect_to crop_player_path(@player), notice: 'Please crop the picture.' }
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
      else
        @player.update_attributes(params[:player])
          format.html { redirect_to print_card_player_path(@player), notice: 'Updated'}
          format.json { head :ok }
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
  def correct_user
    @player = Player.find(params[:id])
    if @player != current_player  && !current_player.admin
      sign_out current_player
      redirect_to root_path, notice: 'You are not authorized to view that page!'
    end 
  end
end
