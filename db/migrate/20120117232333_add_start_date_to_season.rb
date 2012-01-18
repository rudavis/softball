class AddStartDateToSeason < ActiveRecord::Migration
  def change
    add_column :seasons, :start_date, :date
    add_column :seasons, :end_date, :date
  end
end
