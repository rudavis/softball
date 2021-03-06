class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :hits
      t.integer :rbis
      t.integer :at_bats
      t.integer :walks
      t.string :name
      t.references :player

      t.timestamps
    end
    add_index :games, :player_id
  end
end
