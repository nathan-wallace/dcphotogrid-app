class AddAdminAndLicenseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :license, :boolean, :default => false
  end
end
