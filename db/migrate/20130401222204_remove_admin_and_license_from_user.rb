class RemoveAdminAndLicenseFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :admin
    remove_column :users, :license
  end

  def down
    add_column :users, :license, :boolean
    add_column :users, :admin, :boolean
  end
end
