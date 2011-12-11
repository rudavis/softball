class AddTotalBasesToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :total_bases, :integer
  end
end
