class DropTeamIdFromPlayers < ActiveRecord::Migration
  def up
    remove_column :players, :team_id
  end
end
