class DropTotalBases < ActiveRecord::Migration
  def up
    remove_column :games, :total_bases
    remove_column :seasons, :total_bases
  end

end
