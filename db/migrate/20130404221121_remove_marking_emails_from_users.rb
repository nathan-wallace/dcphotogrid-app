class RemoveMarkingEmailsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :marking_emails
  end

  def down
    add_column :users, :marking_emails, :boolean
  end
end
