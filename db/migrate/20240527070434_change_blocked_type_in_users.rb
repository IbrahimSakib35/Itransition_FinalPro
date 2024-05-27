class ChangeBlockedTypeInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :blocked, :string, default: "active"
  end
end
