class ChangeAdminAndBlockedTypeInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :admin, :string, default: "user"
    change_column :users, :blocked, :string, default: "active"
  end
end
