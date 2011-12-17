class TeamsController < ApplicationController
  def index
    @teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  def new
    @team = Team.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end
  
  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to :action => :index, notice: 'Team was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end
end
