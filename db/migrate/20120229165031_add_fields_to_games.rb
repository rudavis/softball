class AddFieldsToGames < ActiveRecord::Migration
  def up
    add_column :games, :runs, :integer
    add_column :games, :singles, :integer
    add_column :games, :doubles, :integer
    add_column :games, :triples, :integer
    add_column :games, :homeruns, :integer
  end
end
