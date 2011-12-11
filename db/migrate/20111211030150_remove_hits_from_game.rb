class RemoveHitsFromGame < ActiveRecord::Migration
  def up
    change_table :games do |p|
      p.remove :batting_average, :slugging_percentage, :on_base_percentage
    end 
  end

  def down
    add_column :players, :batting_average, :double
    add_column :players, :on_base_percentage, :double
    add_column :players, :slugging_percentage, :double
  end
end
