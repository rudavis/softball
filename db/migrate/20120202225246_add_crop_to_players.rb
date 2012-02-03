class AddCropToPlayers < ActiveRecord::Migration
  def up
    add_column :players, :crop_x, :integer
    add_column :players, :crop_y, :integer
    add_column :players, :crop_w, :integer
    add_column :players, :crop_h, :integer        
  end
end
