class AddRunsToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :hits, :integer
    add_column :players, :rbis, :integer
    add_column :players, :at_bats, :integer
    add_column :players, :walks, :integer
    add_column :players, :runs, :integer
    add_column :players, :singles, :integer
    add_column :players, :doubles, :integer
    add_column :players, :triples, :integer
    add_column :players, :homeruns, :integer
    add_column :players, :batting_average, :double
    add_column :players, :on_base_percentage, :double
    add_column :players, :slugging_percentage, :double
  end
end
