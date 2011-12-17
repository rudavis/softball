class HomeController < ApplicationController
  def index
#I probably should comment these out...
    @players = Player.all
    @player = Player.new
  end

end
