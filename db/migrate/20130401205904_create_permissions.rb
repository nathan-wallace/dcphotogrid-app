class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.boolean :admin
      t.boolean :license

      t.timestamps
    end
  end
end
