class ChangeNameToTeamName < ActiveRecord::Migration
  def up
    rename_column :games, :name, :team_name
  end

  def down
    rename_column :games, :team_name, :name
  end
end
