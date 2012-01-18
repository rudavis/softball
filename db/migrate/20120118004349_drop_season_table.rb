class DropSeasonTable < ActiveRecord::Migration
  def up
    remove_index :seasons, :name => "index_seasons_on_player_id"
    drop_table :seasons
    rename_column :games, :season_id, :player_id
    remove_index :games, :name => "index_games_on_season_id"
    add_index :games, :player_id
  end
end
