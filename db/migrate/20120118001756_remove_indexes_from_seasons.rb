class RemoveIndexesFromSeasons < ActiveRecord::Migration
  def up
    remove_index :games, :name => "index_games_on_season_id"
    remove_index :seasons, :name => "index_seasons_on_player_id"
    add_index :games, :season_id
    add_index :seasons, :player_id
  end
end
