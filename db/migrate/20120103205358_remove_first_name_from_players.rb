class RemoveFirstNameFromPlayers < ActiveRecord::Migration
  def up
    remove_column :players, :first_name
    remove_column :players, :last_name
    remove_column :players, :nick_name
  end

  def down
    add_column :players, :nick_name, :string
    add_column :players, :last_name, :string
    add_column :players, :first_name, :string
  end
end
