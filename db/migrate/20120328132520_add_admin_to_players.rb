class AddAdminToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :admin, :boolean, :default => 0
  end
end
