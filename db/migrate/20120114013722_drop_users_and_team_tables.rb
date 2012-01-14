class DropUsersAndTeamTables < ActiveRecord::Migration
  def up
    drop_table "users"
    drop_table "teams"
  end
end
