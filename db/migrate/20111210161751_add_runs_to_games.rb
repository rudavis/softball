class AddRunsToGames < ActiveRecord::Migration
  def change
    add_column :games, :runs, :integer
    add_column :games, :singles, :integer
    add_column :games, :doubles, :integer
    add_column :games, :triples, :integer
    add_column :games, :homeruns, :integer
    add_column :games, :batting_average, :double
    add_column :games, :on_base_percentage, :double
    add_column :games, :slugging_percentage, :double
  end
end
