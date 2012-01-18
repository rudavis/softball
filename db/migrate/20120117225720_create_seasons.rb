class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :hits
      t.integer :rbis
      t.integer :at_bats
      t.integer :walks
      t.integer :runs
      t.integer :singles
      t.integer :doubles
      t.integer :triples
      t.integer :homeruns
      t.integer :total_bases
      t.integer :strike_outs
      t.boolean :current
      t.timestamps
    end
  end
end
