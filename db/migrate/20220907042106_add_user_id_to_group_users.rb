class AddUserIdToGroupUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :group_users, :UserId, :integer
  end
end
