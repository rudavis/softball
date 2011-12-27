class AddFirstNameToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :first_name, :string
    add_column :players, :last_name, :string
    add_column :players, :nick_name, :string
    add_column :players, :bats, :string
    add_column :players, :throws, :string
    add_column :players, :position, :string
  end
end
