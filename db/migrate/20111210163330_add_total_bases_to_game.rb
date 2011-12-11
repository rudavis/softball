class AddTotalBasesToGame < ActiveRecord::Migration
  def change
    add_column :games, :total_bases, :integer
  end
end
