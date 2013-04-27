class AddLocationToImage < ActiveRecord::Migration
  def change
    add_column :pins, :img_loc_lat, :decimal, :default => "", :null => false
    add_column :pins, :img_loc_lng, :decimal, :default => "", :null => false
end
