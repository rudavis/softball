class AddNotesToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :notes, :string
  end
end
