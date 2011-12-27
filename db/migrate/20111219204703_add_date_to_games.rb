class AddDateToGames < ActiveRecord::Migration
  def up
    add_column :games, :date, :date
    add_column :games, :strike_outs, :integer
  end

  def down
    remove_column :games, :date, :date
    remove_column :games, :strike_outs, :integer
  end
end
