class AddMarketingEmailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :marketing_emails, :boolean, :default => false
  end
end
