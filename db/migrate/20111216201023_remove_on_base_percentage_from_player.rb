class RemoveOnBasePercentageFromPlayer < ActiveRecord::Migration
  def up
    remove_column :players, :on_base_percentage
  end

  def down
    add_column :players, :on_base_percentage, :float
  end
end
