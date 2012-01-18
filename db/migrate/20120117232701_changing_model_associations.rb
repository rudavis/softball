class ChangingModelAssociations < ActiveRecord::Migration
  def up
    remove_index :games, :name => "index_games_on_player_id"
    remove_column :games, :player_id
    add_column :games, :season_id, :integer
    add_index :games, :season_id, :unique => true
    add_column :seasons, :player_id, :integer
    add_index :seasons, :player_id, :unique => true
  end
end
