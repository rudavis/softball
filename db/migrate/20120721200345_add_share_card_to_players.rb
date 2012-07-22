class AddShareCardToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :share_card, :boolean, :default => false
  end
end
