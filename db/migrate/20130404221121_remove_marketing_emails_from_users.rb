class RemoveMarketingEmailsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :marketing_emails
  end

  def down
    add_column :users, :marketing_emails, :boolean
  end
end
